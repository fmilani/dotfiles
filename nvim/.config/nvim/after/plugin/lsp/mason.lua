local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local mason_null_ls = require('mason-null-ls')

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "tsserver",
    "html",
    "tailwindcss",
    "sumneko_lua",
  }
})

mason_null_ls.setup({
  ensure_installed = {
    "prettier",
    "stylua",
    "eslint_d",
  }
})
