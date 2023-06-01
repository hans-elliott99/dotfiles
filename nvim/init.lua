-- init.lua
-- 
-- lazy.nvim: https://github.com/folke/lazy.nvim
-- inspo: https://github.com/brainfucksec/neovim-lua/tree/main/nvim/
-- `nvim` folder link should exist at ~/.config/nvim

-- CORE
-- loads (and installs if needed) the Lazy package manager
require("core/lazy")
-- core options and edits
require("core/colors")
require("core/options")
require("core/keymaps")
-- PLUGINS
-- sets up miscellaneous plugins
require("plugins/vim-slime")
require("plugins/treesitter")
require("plugins/nvim-tree")
-- LSP
-- loads Mason, the LSP package manager, and specific lang servers
require("lsp/lspconfig")
-- code completion config using nvim-cmp
require("lsp/completion")


