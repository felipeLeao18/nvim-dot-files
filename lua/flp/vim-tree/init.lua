-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    relativenumber = true,
    number = true,
    adaptive_size = true,
    mappings = {list = {{key = "u", action = "dir_up"}}}
  },
  renderer = {group_empty = true},
  filters = {dotfiles = false},
  git = {enable = true, ignore = false, show_on_dirs = true, timeout = 400}
})
