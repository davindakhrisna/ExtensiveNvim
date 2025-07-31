-- Discord Rich Presence control keymaps
return {
  "folke/which-key.nvim",
  optional = true,
  opts = {
    spec = {
      { "<leader>d", group = "Discord" },
      { "<leader>dp", desc = "Toggle Discord Presence" },
      { "<leader>dr", desc = "Reconnect Discord" },
      { "<leader>ds", desc = "Show Discord Status" },
    },
  },
  init = function()
    -- Discord Rich Presence keymaps
    vim.keymap.set("n", "<leader>dp", function()
      if package.loaded.neocord then
        -- Toggle presence
        local neocord = require("neocord")
        if neocord.presence_enabled then
          neocord:disable()
          vim.notify("Discord Rich Presence disabled", vim.log.levels.INFO)
        else
          neocord:enable()
          vim.notify("Discord Rich Presence enabled", vim.log.levels.INFO)
        end
      else
        vim.notify("Neocord not loaded", vim.log.levels.WARN)
      end
    end, { desc = "Toggle Discord Presence" })

    vim.keymap.set("n", "<leader>dr", function()
      if package.loaded.neocord then
        -- Reconnect to Discord
        local neocord = require("neocord")
        neocord:reconnect()
        vim.notify("Discord Rich Presence reconnected", vim.log.levels.INFO)
      else
        vim.notify("Neocord not loaded", vim.log.levels.WARN)
      end
    end, { desc = "Reconnect Discord" })

    vim.keymap.set("n", "<leader>ds", function()
      if package.loaded.neocord then
        local neocord = require("neocord")
        local status = neocord.presence_enabled and "enabled" or "disabled"
        local connection = neocord.connected and "connected" or "disconnected"
        vim.notify(
          string.format("Discord Rich Presence: %s (%s)", status, connection),
          vim.log.levels.INFO
        )
      else
        vim.notify("Neocord not loaded", vim.log.levels.WARN)
      end
    end, { desc = "Show Discord Status" })
  end,
}
