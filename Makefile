.PHONY: keyd # always run if called

help:
	@echo "Helper file to easily intall config files that wont be managed by stow since they change so rarely"

keyd:
	@sudo cp -i ~/.dotfiles/keyd/keyd.conf /etc/keyd/keyd.conf
