-- Better swap file handling to prevent Neo-Tree errors
-- Configure Neovim to handle swap files more gracefully

-- Set swap file directory to a dedicated location
vim.opt.directory = vim.fn.stdpath("state") .. "/swap//"

-- Create the swap directory if it doesn't exist
local swap_dir = vim.fn.stdpath("state") .. "/swap"
if vim.fn.isdirectory(swap_dir) == 0 then
  vim.fn.mkdir(swap_dir, "p")
end

-- Configure swap file behavior
vim.opt.swapfile = false -- Enable swap files (default)
vim.opt.updatetime = 250 -- Write swap file after 250ms of inactivity

-- Auto-recover from swap files with confirmation
vim.api.nvim_create_autocmd("SwapExists", {
  pattern = "*",
  callback = function()
    -- Get information about the swap file
    local swap_file = vim.v.swapname
    local original_file = vim.fn.expand("<afile>")

    -- Check if another Neovim instance is using the file
    local swap_info = vim.fn.getftime(swap_file)
    if swap_info == -1 then
      -- Swap file doesn't exist or is corrupted, delete it
      vim.fn.delete(swap_file)
      vim.v.swapchoice = "" -- Use the file normally
      return
    end

    -- Ask user what to do with more helpful options
    local choice = vim.fn.confirm(
      "Swap file found for "
        .. vim.fn.fnamemodify(original_file, ":t")
        .. "\\n"
        .. "Another instance might be editing this file.\\n"
        .. "What do you want to do?",
      "&Open Read-Only\\&Edit Anyway\\&Recover\\&Delete Swap\\n&Quit",
      1
    )

    if choice == 1 then
      vim.v.swapchoice = "o" -- Open read-only
    elseif choice == 2 then
      vim.v.swapchoice = "e" -- Edit anyway
    elseif choice == 3 then
      vim.v.swapchoice = "r" -- Recover
    elseif choice == 4 then
      vim.fn.delete(swap_file)
      vim.v.swapchoice = "" -- Delete swap and open normally
    else
      vim.v.swapchoice = "q" -- Quit
    end
  end,
})

-- Clean up swap files on exit
vim.api.nvim_create_autocmd("VimLeave", {
  pattern = "*",
  callback = function()
    -- Clean up old swap files (older than 1 day)
    local swap_dir = vim.fn.stdpath("state") .. "/swap"
    if vim.fn.isdirectory(swap_dir) == 1 then
      local old_files = vim.fn.globpath(swap_dir, "*", 0, 1)
      local now = os.time()
      for _, file in ipairs(old_files) do
        local file_time = vim.fn.getftime(file)
        if file_time ~= -1 and (now - file_time) > 86400 then -- 1 day
          vim.fn.delete(file)
        end
      end
    end
  end,
})
