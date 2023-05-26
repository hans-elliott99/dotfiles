
-- Mason - LSP package manager
require("mason").setup()
require("mason-lspconfig").setup()

-- LSP Config
lspconfig = require("lspconfig")
util = require("lspconfig/util")

lspconfig.pylsp.setup({})
-- lspconfig.r_languageserver.setup({})

