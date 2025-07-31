-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "i" }, "<leader>R", function()
  if require("luasnip").expand_or_jumpable() then
    require("luasnip").expand()
  end
end, { desc = "Expand RAFCE snippet" })
