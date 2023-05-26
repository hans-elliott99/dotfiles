--disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

