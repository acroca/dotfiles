update_zsh_dependencies() {
  echo "Updating zsh-syntax-highlighting..."
	curl -s -L -o zsh-syntax-highlighting-master.tar.gz https://github.com/zsh-users/zsh-syntax-highlighting/archive/master.tar.gz
	chezmoi import --strip-components 1 --destination ${HOME}/.zsh/zsh-syntax-highlighting zsh-syntax-highlighting-master.tar.gz
	rm zsh-syntax-highlighting-master.tar.gz

  echo "Updating zsh-autosuggestions..."
	curl -s -L -o zsh-autosuggestions-master.tar.gz https://github.com/zsh-users/zsh-autosuggestions/archive/master.tar.gz
	chezmoi import --strip-components 1 --destination ${HOME}/.zsh/zsh-autosuggestions zsh-autosuggestions-master.tar.gz
	rm zsh-autosuggestions-master.tar.gz
}
