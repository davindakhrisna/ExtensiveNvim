return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- Only install what you actually need
      "lua-language-server",
      "eslint-lsp", -- This should only install once
      "stylua",
      "svelte-language-server", -- Svelte support
    },
    -- Disable automatic installation of missing servers
    automatic_installation = false,
    -- Reduce installation log noise
    log_level = vim.log.levels.INFO,
  },
}
