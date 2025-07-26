return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp", -- Optional: For enhanced completion
    "nvim-telescope/telescope.nvim", -- Optional: For file selection
    "stevearc/dressing.nvim", -- Optional: For input dialogs
  },
  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = {
          adapter = "gemini",
        },
        inline = {
          adapter = "gemini",
        },
        agent = {
          adapter = "gemini",
        },
      },
      adapters = {
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            env = {
              api_key = "GEMINI_API_KEY",
            },
            headers = {
              ["Content-Type"] = "application/json",
            },
            parameters = {
              model = "gemini-2.0-flash",
              temperature = 0.7,
              max_tokens = 4096,
            },
          })
        end,
      },
      actions = {
        {
          name = "Custom Prompt",
          strategy = "chat",
          description = "Prompt the LLM from Neovim",
          opts = {
            modes = { "n", "v" },
            short_name = "custom",
            auto_submit = true,
            user_prompt = true,
            stop_context_insertion = false,
          },
          prompts = {
            {
              role = "system",
              content = function()
                return "I want you to act as a senior software engineer. Please review the following code and provide suggestions for improvement, bug fixes, or optimizations. Be concise but thorough."
              end,
            },
            {
              role = "user",
              content = function(context)
                local text = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)
                return "Please review this code:\n\n```" .. context.filetype .. "\n" .. text .. "\n```"
              end,
            },
          },
        },
        {
          name = "Explain Code",
          strategy = "chat",
          description = "Explain how the selected code works",
          opts = {
            modes = { "v" },
            short_name = "explain",
            auto_submit = true,
          },
          prompts = {
            {
              role = "system",
              content = "Explain the following code in simple terms. Focus on what it does, how it works, and any important concepts.",
            },
            {
              role = "user",
              content = function(context)
                local text = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)
                return "Explain this code:\n\n```" .. context.filetype .. "\n" .. text .. "\n```"
              end,
            },
          },
        },
        {
          name = "Generate Tests",
          strategy = "chat",
          description = "Generate unit tests for the selected code",
          opts = {
            modes = { "v" },
            short_name = "tests",
            auto_submit = true,
          },
          prompts = {
            {
              role = "system",
              content = "Generate comprehensive unit tests for the given code. Include edge cases and follow testing best practices for the language.",
            },
            {
              role = "user",
              content = function(context)
                local text = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)
                return "Generate unit tests for this code:\n\n```" .. context.filetype .. "\n" .. text .. "\n```"
              end,
            },
          },
        },
        {
          name = "Optimize Code",
          strategy = "inline",
          description = "Optimize the selected code for performance",
          opts = {
            modes = { "v" },
            short_name = "optimize",
            auto_submit = true,
          },
          prompts = {
            {
              role = "system",
              content = "Optimize the following code for better performance, readability, and maintainability. Return only the optimized code without explanations.",
            },
            {
              role = "user",
              content = function(context)
                local text = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)
                return "Optimize this code:\n\n```" .. context.filetype .. "\n" .. text .. "\n```"
              end,
            },
          },
        },
      },
      display = {
        action_palette = {
          width = 95,
          height = 10,
          prompt = "Prompt ",
          border = "single",
          winblend = 0,
        },
        chat = {
          window = {
            layout = "vertical", -- float|vertical|horizontal|buffer
            border = "single",
            height = 0.8,
            width = 0.45,
            relative = "editor",
            opts = {
              breakindent = true,
              cursorcolumn = false,
              cursorline = false,
              foldcolumn = "0",
              linebreak = true,
              list = false,
              signcolumn = "no",
              spell = false,
              wrap = true,
            },
          },
          intro_message = "Welcome! I'm powered by Gemini and ready to help with your code.",
          separator = "─",
          show_settings = false,
          show_token_count = true,
        },
      },
      keymaps = {
        ["<C-s>"] = "keymaps.save",
        ["<C-c>"] = "keymaps.close",
        ["q"] = "keymaps.cancel_request",
        ["gc"] = "keymaps.clear",
        ["ga"] = "keymaps.codeblock",
        ["gs"] = "keymaps.save_chat",
        ["gt"] = "keymaps.add_tool",
        ["]"] = "keymaps.next",
        ["["] = "keymaps.previous",
      },
      log_level = "ERROR", -- TRACE|DEBUG|ERROR|INFO
      send_code = true, -- Send code context to LLM? Disable to reduce token usage
      silence_notifications = false, -- Silence notifications for actions like saving to disk
    })

    -- Key mappings for CodeCompanion
    vim.keymap.set(
      { "n", "v" },
      "<leader>cc",
      "<cmd>CodeCompanionActions<cr>",
      { noremap = true, silent = true, desc = "CodeCompanion Actions" }
    )
    vim.keymap.set(
      { "n", "v" },
      "<leader>ct",
      "<cmd>CodeCompanionToggle<cr>",
      { noremap = true, silent = true, desc = "Toggle CodeCompanion" }
    )
    vim.keymap.set(
      "v",
      "<leader>ce",
      "<cmd>CodeCompanionActions<cr>",
      { noremap = true, silent = true, desc = "Explain Code" }
    )
    vim.keymap.set(
      "v",
      "<leader>co",
      "<cmd>CodeCompanionActions<cr>",
      { noremap = true, silent = true, desc = "Optimize Code" }
    )
    vim.keymap.set(
      { "n", "v" },
      "<leader>cp",
      "<cmd>CodeCompanion<cr>",
      { noremap = true, silent = true, desc = "Prompt CodeCompanion" }
    )

    -- Add CodeCompanion to lualine (if you use it)
    vim.api.nvim_create_autocmd({ "User" }, {
      pattern = "CodeCompanionRequest*",
      callback = function(request)
        if request.match == "CodeCompanionRequestStarted" then
          vim.notify("CodeCompanion request started...")
        elseif request.match == "CodeCompanionRequestFinished" then
          vim.notify("CodeCompanion request completed!")
        end
      end,
    })
  end,
  event = "VeryLazy",
}
