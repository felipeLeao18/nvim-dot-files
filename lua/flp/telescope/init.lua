local status_telescope_ok, telescope = pcall(require, "telescope")
if not status_telescope_ok then
  return
end

local actions = require("telescope.actions")

telescope.setup {
  defaults = {
    file_ignore_patterns = { "node_modules" },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    color_devicons = true,
    layout_strategy = "flex",
    layout_config = {
      horizontal = {
        mirror = false
      },
      vertical = {
        mirror = false
      },
      preview_cutoff = 0
    },
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    mappings = {
      i = {
        ["<C-\\>"] = actions.which_key,
        ["<C-n>"] = actions.move_selection_previous,
        ["<C-p>"] = actions.move_selection_next
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case" -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
     media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    }
  },
}
telescope.load_extension("ui-select")
telescope.load_extension("fzf")
telescope.load_extension("file_browser")
telescope.load_extension("media_files")


require("flp.telescope.mappings")
