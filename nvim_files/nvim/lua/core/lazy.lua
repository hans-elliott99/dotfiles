------------------------------------------
------------------- LAZY PLUGIN MANAGER
lazy_plugins = {
	--TokyoNight theme
	{"folke/tokyonight.nvim", },
	--Icons
	{"nvim-tree/nvim-web-devicons"},
	--NvimTree File Explorer
	{"nvim-tree/nvim-tree.lua",
		requires = "nvim-tree/nvim-web-devicons"
	},
	--Vim-Slime to send code to terminal
	{"jpalardy/vim-slime"},
	--TreeSitter syntax highlighting
	{"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	},
	--LSP package management
	{"williamboman/mason.nvim",
		run = ":MasonUpdate" 
	},
	{"williamboman/mason-lspconfig.nvim"},
	{"neovim/nvim-lspconfig"},
	--LSP plugins for code completion
	{"hrsh7th/nvim-cmp"},
	{"hrsh7th/cmp-nvim-lsp"},
	{"hrsh7th/cmp-nvim-lua"},
	{"hrsh7th/cmp-nvim-lsp-signature-help"},
	{"hrsh7th/cmp-vsnip"},
	{"hrsh7th/cmp-path"},                              
    {"hrsh7th/cmp-buffer"},                            
    {"hrsh7th/vim-vsnip"},
}
lazy_opts = {}

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
    print("git cloned")
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    return
end

require("lazy").setup(lazy_plugins, lazy_opts)
