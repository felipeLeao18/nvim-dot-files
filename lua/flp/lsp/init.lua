local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'jsonls',
  'cssls',
  'html',
  'eslint',
  'sumneko_lua',
})

lsp.configure('eslint', {
  on_attach = function(client)
    client.server_capabilities.document_formatting = true

    local autogroup_eslint_lsp = vim.api.nvim_create_augroup("eslint_lsp", {clear = true})

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      command = "EslintFixAll",
      group = autogroup_eslint_lsp
    })
  end
})

lsp.set_preferences({
   set_lsp_keymaps = {omit = {'gr', 'gd', ']d', '[d', 'gD'}},
})


lsp.setup()
