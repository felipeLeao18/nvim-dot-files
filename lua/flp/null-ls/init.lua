local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local actions = null_ls.builtins.code_actions


null_ls.setup({
  sources = {
    formatting.black, formatting.gofmt, formatting.shfmt, formatting.clang_format,
    formatting.rustfmt,
    formatting.cmake_format, formatting.dart_format, formatting.lua_format.with({
      extra_args = {
        '--no-keep-simple-function-one-line', '--no-break-after-operator', '--column-limit=100',
        '--break-after-table-lb', '--indent-width=2'
      }
    }), formatting.isort, formatting.codespell.with({filetypes = {'markdown'}}), formatting.prismaFmt
  }
})

