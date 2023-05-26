syntax on
filetype plugin indent on

"plugins
set runtimepath^=~/.vim/pack/vendor/start/*

"aestheric & behavior
set tabstop=4
set shiftwidth=4
set expandtab
set guifont=Iosevka\ 20
set guioptions-=m
set guioptions-=T
"set relativenumber
set number
set ignorecase
set smartcase
set incsearch
set autochdir
set cinoptions=l1
colorscheme desert

"key binds for file browsing w netrw
nmap <leader>f :Explore<CR>
nmap <leader><s-f> :edit.<CR>
let g:netrw_altv = 1
let g:netrw_dirhistmax = 0

"use slime to execute code in a tmux window
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name" : get(split($TMUX, ","), 0), "target_pane" : ":.1"}

