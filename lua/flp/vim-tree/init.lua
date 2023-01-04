-- OR setup with some options
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    relativenumber = true,
    number = true,
    adaptive_size = true,
    mappings = {list = {{key = "u", action = "dir_up"}}}
  },
  renderer = {
    group_empty = true,
    indent_markers = {
        enable = true,
        icons = {
          corner = "└ ",
          edge = "│ ",
          item = "│ ",
          none = "  ",
        },
      },
  },

  filters = {dotfiles = false},

  git = {enable = true, ignore = false, show_on_dirs = true, timeout = 400},

  diagnostics = {
      enable = true,
      show_on_dirs = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
})
