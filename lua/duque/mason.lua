require('mason').setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    'tsserver',
    'lua_ls',
    'pyright'
  }
}

require('lspconfig').lua_ls.setup{}
require('lspconfig').tsserver.setup{}
require('lspconfig').pyright.setup{}
