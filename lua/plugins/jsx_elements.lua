return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = function(_, opts)
    opts.ensure_installed = opts.ensure_installed or {}
    table.insert(opts.ensure_installed, "javascript")
    table.insert(opts.ensure_installed, "typescript")
    table.insert(opts.ensure_installed, "tsx")

    opts.textobjects = {
      select = {
        enable = true,
        ["iJ"] = { query = "@jsx_element.inner", desc = "Select inner JSX element" },
        ["aJ"] = { query = "@jsx_element.outer", desc = "Select outer JSX element" },
      },
    }
  end,
}
