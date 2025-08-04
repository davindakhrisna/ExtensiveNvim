-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "<C-x>", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
end, { desc = "Copy current file path to clipboard" })
