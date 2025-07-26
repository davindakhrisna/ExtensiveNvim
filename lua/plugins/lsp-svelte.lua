-- Svelte language server configuration
-- ✅ Node.js and npm are required for Svelte development

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      svelte = {
        settings = {
          svelte = {
            -- Enable TypeScript support
            plugin = {
              typescript = {
                enable = true,
                diagnostics = { enable = true },
                hover = { enable = true },
                documentSymbols = { enable = true },
                completions = { enable = true },
                findReferences = { enable = true },
                definitions = { enable = true },
                codeActions = { enable = true },
                selectionRange = { enable = true },
                rename = { enable = true },
                semanticTokens = { enable = true },
              },
            },
          },
        },
      },
    },
    setup = {
      svelte = function(_, opts)
        -- Ensure TypeScript is available for Svelte files
        local lsp = require("lazyvim.util").lsp
        lsp.on_attach(function(client, bufnr)
          if client.name == "svelte" then
            -- Set up additional keybindings for Svelte
            vim.keymap.set("n", "<leader>cs", function()
              vim.cmd("SvelteRestart")
            end, { buffer = bufnr, desc = "Restart Svelte Language Server" })
          end
        end)
      end,
    },
  },
}
