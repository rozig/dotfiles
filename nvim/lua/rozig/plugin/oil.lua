return {
  "stevearc/oil.nvim",
  default_file_explorer = true,
  ---@module 'oil'
  columns = {
    "icon",
    -- "permissions",
    -- "size",
    -- "mtime",
  },
  ---@type oil.SetupOpts
  opts = {},
  view_options = {
    show_hidden = true,
  },
  --- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
