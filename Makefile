#
#TODO: modularize - put each pkgs setup instructions within their dirs

DOTFILES := $(shell basename $(CURDIR))

.ONESHELL:

default: clean vim tmux nvim r

min: clean vim tmux_min

vim:
	@echo ""
	@echo "*LINKING VIM*"
	@cd ~ && \
		echo "***In home (~) directory." && \
		ln -s ~/$(DOTFILES)/vim_files/vim .vim && \
		ln -s ~/$(DOTFILES)/vim_files/vimrc .vimrc && \
		echo "***Added ~/vim, ~/.vimrc"
	@cd ~/$(DOTFILES)/vim_files && \
		echo "***In vim_files (~/$(DOTFILES)/vim_files) directory." && \
		echo "***Updating plugins..."
		bash ./setup.sh

tmux:
	@echo ""
	@echo "*LINKING TMUX*"
	@cd ~ && \
		echo "***In home (~) directory." && \
		ln -s ~/$(DOTFILES)/tmux_files/tmux.conf .tmux.conf && \
		echo "***Added ~/.tmux.conf"

tmux_min:
	@echo ""
	@echo "*LINKING TMUX (minimal configuration)*"
	@cd ~ && \
		echo "***In home (~) directory." && \
		ln -s ~/$(DOTFILES)/tmux_files/tmux.conf.min .tmux.conf && \
		echo "***Added minimal ~/.tmux.conf"

nvim:
	@echo ""
	@echo "*LINKNG NVIM*"
	@mkdir -p ~/.config
	@cd ~/.config && \
		echo "***In config (~/.config) directory." && \
		ln -s ~/$(DOTFILES)/nvim_files/nvim nvim && \
		echo "***Added ~/.config/nvim"

r:
	@echo ""
	@echo "*ADDING R FILES*"
	@cd ~ && \
		echo "***In home (~) directory." && \
		ln -s ~/$(DOTFILES)/R_files/Rprofile .Rprofile && \
		ln -s ~/$(DOTFILES)/R_files/lintr .lintr && \
		echo "***Added ~/.Rprofile, ~/.lintr"

clean:
	rm -rf ~/.vim
	rm -f ~/.vimrc
	rm -f ~/.tmux.conf*
	rm -f ~/.config/nvim
	rm -f ~/.Rprofile
	rm -f ~/.lintr
