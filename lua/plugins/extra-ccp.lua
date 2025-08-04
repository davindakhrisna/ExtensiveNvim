return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",
    opts = {
      mappings = {
        complete = {
          insert = "<C-x>",
        },
        show_diff = {
          full_diff = true,
        },
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
