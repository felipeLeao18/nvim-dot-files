local lsp = require('lsp-zero')

lsp.preset({
  float_border = 'none',
  configure_diagnostics = false,
  manage_nvim_cmp = {
    set_sources = 'recommended'
  }
})
lsp.ensure_installed({
  'tsserver',
  'jsonls',
  'cssls',
  'html',
  'eslint'
})

lsp.configure('eslint', {
  on_attach = function(client)
    client.server_capabilities.document_formatting = true

    local autogroup_eslint_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      command = "EslintFixAll",
      group = autogroup_eslint_lsp
    })
  end
})

lsp.configure('rust-analyzer', {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = { command = "clippy" },
      procMacro = {
        attributes = {
          enable = true
        },
        enable = true
      }
    }
  }
})

lsp.setup()
