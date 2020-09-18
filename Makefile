update_dependencies:
	curl -s -L -o zsh-syntax-highlighting-master.tar.gz https://github.com/zsh-users/zsh-syntax-highlighting/master.tar.gz
	chezmoi import --strip-components 1 --destination ${HOME}/.oh-my-zsh zsh-syntax-highlighting-master.tar.gz
	rm zsh-syntax-highlighting-master.tar.gz
