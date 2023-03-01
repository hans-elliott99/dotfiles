
-- init.lua
-- 
-- Intro: https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/
-- lazy.nvim: https://github.com/folke/lazy.nvim

-- disable netrw first if using nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "

------------------- PLUGIN MANAGER ---------------------
lazy_plugins = {
	{"folke/tokyonight.nvim"},
	{"nvim-tree/nvim-tree.lua",
            requires="nvim-tree/nvim-web-devicons"
	},
	{"ms-jpq/coq_nvim"},
	{"nvim-treesitter/nvim-treesitter", cmd="TSUpdate"},
}
lazy_opts = {}

function lazy_install(path)
    if not vim.loop.fs_stat(path) then
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            path,
        })
    end
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- install lazy if it doesn't exist yet
local f = io.open(lazypath, "r")
if f~=nil then 
    print("Installing Lazy package manager...")
    lazy_install(lazypath)
end
io.close(f)

vim.opt.rtp:prepend(lazypath)
require("lazy").setup(lazy_plugins, lazy_opts)

----------------------- PLUGINS -------------------------
-- set color scheme before anything else
vim.cmd.colorscheme('tokyonight')

-- nvim-tree
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
	side  = "left",
    mappings = {
      list = {
       -- { key = "u", action = "dir_up" },
	  },
    },
  },
  renderer = {
    group_empty = true,
	highlight_git = true,
	add_trailing = true,

  },
  filters = {
    dotfiles = false,
	git_clean = true,
  },
  git = {
    enable = false,
	ignore = false,
	timeout = 500,
  },
})


--coq
vim.g.coq_settings = {
  auto_start = true
}
require("coq")


--tree-sitter
parser_install_dir = vim.fn.stdpath("data") .. "/ts_parsers"
vim.opt.runtimepath:append(parser_install_dir)

require('nvim-treesitter.configs').setup({
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "help" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. 
    -- list of specific languages that will be disabled
    disable = {},
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
})

------------------------ OPTIONS -------------------------
vim.opt.clipboard = "unnamedplus"

-- General Options
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false --noh prev search
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.colorcolumn = "79"
---- tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

