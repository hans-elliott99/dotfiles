-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  	local options = { noremap=true, silent=true }
  	if opts then
    	options = vim.tbl_extend('force', options, opts)
  	end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = ','


-- vim-slime
map("n", "<C-m>", "<Plug>SlimeRegionSend")
map("n", "<C-m>", "<Plug>SlimeParagraphSend")
map("n", "<c-c>v", "<Plug>SlimeConfig")

