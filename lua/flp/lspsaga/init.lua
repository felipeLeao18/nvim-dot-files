require('lspsaga').setup({
  finder = {
    border = 'rounded',
    width = 2,
    height = 2,
  },
  diagnostic = {
    border = 'rounded',
    width = 0.8,
    height = 0.8,
  },
  
})
local keymap = vim.keymap.set
-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga finder<CR>", { silent = true })

-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

keymap("n", "gD", "<cmd>Lspsaga goto_definition<CR>")
-- Show line diagnostics
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })


-- Diagnostic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Only jump to error
keymap("n", "[E", function()
  require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
  require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Outline
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { silent = true })

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- Float terminal
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
-- if you want to pass some cli command into a terminal you can do it like this
-- open lazygit in lspsaga float terminal
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", { silent = true })
-- close floaterm
keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
