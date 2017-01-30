DOTPATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*) bin
EXCLUSIONS := .DS_Store .git .gitmodules .travis.yml .gitignore .config
DOTFILES := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
INITFILES = $(shell find etc/init -type f -name '*.sh')
DOTCONFIG = $(shell find .config -type f)
all: install

help:
	@echo "make list           #=> Show dot files in this repo"
	@echo "make deploy         #=> Create symlink to home directory"
	@echo "make init           #=> Setup environment settings"
	@echo "make test           #=> Test dotfiles and init scripts"
	@echo "make update         #=> Fetch changes for this repo"
	@echo "make install        #=> Run make update, deploy, init"
	@echo "make clean          #=> Remove the dot files and this repo"

list:
	@echo "DOTFATH:$(DITPATH)"
	@echo "CANDIDATES:$(CANDIDATES)"
	@echo "EXCLUSIONS:$(EXCLUSIONS)"
	@echo "DOTFILES:$(DOTFILES)"
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)
	@echo "INITFILES:$(INITFILES)"
	@$(foreach val, $(INITFILES), /bin/ls -dF $(val);)
	@echo "DOTCONFIG:$(DOTCONFIG)"

deploy:
	@echo "==> Deploy process starts... Linking dotfiles to your home directory."
	@echo ""
	@echo$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

init:
	@echo$(foreach val, $(INITFILES), bash $(val);)
	@$(foreach val, $(INITFILES), bash $(val);)

test:
	# @DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/test/test.sh
	@echo $(CANDIDATES)
	@echo $(DOTFILES)

update:
	git pull origin master
	git submodule init
	git submodule update
	git submodule foreach git pull origin master

install: update deploy init
	@exec $$SHELL

clean:
	@echo 'Remove dot files in your home directory...'
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)
	-rm -rf $(DOTPATH)
