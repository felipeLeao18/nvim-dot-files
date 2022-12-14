require("zen-mode").setup {
  window = {
    backdrop = 0.95,
    width = 100,
    height = 100,
    options = {signcolumn = "no", number = false, cursorline = false}
  },
  plugins = {
    options = {enabled = true, ruler = false, showcmd = false},
    twilight = {enabled = true},
    gitsigns = {enabled = true},
    tmux = {enabled = true}
  }
}
