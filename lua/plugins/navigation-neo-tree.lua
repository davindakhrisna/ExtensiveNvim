return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
    { "<leader>E", "<cmd>Neotree focus<cr>", desc = "Focus file explorer" },
  },
  opts = {
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = true, -- Show hidden files for better visibility
        hide_dotfiles = false, -- By default, show dotfiles
        hide_gitignored = false, -- Show gitignored files for context
        hide_by_name = {               -- Ignore certain directories and files
          ".git",
          ".DS_Store",
          "swap",
          "*.swp",
        },
        never_show = {            -- Never allow these files to appear
          ".git",
          ".DS_Store",
          "*.swp",
        },
      },
    },
    window = {
      mappings = {
        ["<space>"] = "none",
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
          desc = "Copy Path to Clipboard",
        },
        ["O"] = {
          function(state) require("lazy.util").open(state.tree:get_node().path, { system = true }) end,
          desc = "Open with System Application",
        },
        ["P"] = { "toggle_preview", config = { use_float = false } },
        -- Add safer file opening
        ["<CR>"] = "open",
        ["o"] = "open",
        ["<2-LeftMouse>"] = "open",
      },
    },
    event_handlers = {
      {
        event = "file_open_requested",
        handler = function(args)
          -- Don't try to open swap files or other temporary files
          local path = args.state.path
          if path:match("%.sw[po]$") or path:match("%.tmp$") or path:match("~$") then
            vim.notify("Cannot open temporary/swap file: " .. vim.fn.fnamemodify(path, ":t"), vim.log.levels.WARN)
            return
          end
        end,
      },
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          vim.cmd("highlight! Cursor blend=100")
        end,
      },
      {
        event = "neo_tree_buffer_leave",
        handler = function()
          vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
        end,
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      git_status = {
        symbols = {
          unstaged = "󰄱",
          staged = "󰱒",
        },
      },
    },
  },
}
