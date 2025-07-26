-- ESLint LSP server configuration
-- ✅ Node.js and npm are now installed and available

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      eslint = {
        settings = {
          workingDirectories = { mode = "auto" },
          format = { enable = true },
          codeActionsOnSave = {
            mode = "all",
            source = {
              fixAll = {
                eslint = true,
              },
            },
          },
        },
      },
    },
    setup = {
      eslint = function()
        local lsp = require("lazyvim.util").lsp
        lsp.on_attach(function(client, bufnr)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" or client.name == "vtsls" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
  },
}
