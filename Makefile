HOME := $(HOME)
VIMRC = $(HOME)/.vimrc
GVIMRC = $(HOME)/.gvimrc

BUNDLES = vimproc.vim

default: all

all: dependencies init bundles symlink

init:
	@echo "Initializing and updating submodules"
	@git submodule update --init

dependencies:
	@echo Checking dependencies

# Assume vim and gvim have the same supported features
	@(vim --version | grep "+lua" > /dev/null) || (echo Requires Vim with Lua support && false)
	@(vim --version | grep "+python" > /dev/null) || (echo Requires Vim with Python support && false)

	@which ghc-mod > /dev/null 2>&1 || (echo Missing ghc-mod && false)
	@which cabal > /dev/null 2>&1 || (echo Missing cabal && false)
	@which tmux > /dev/null 2>&1 || (echo Missing tmux && false)
	@which gnome-terminal > /dev/null 2>&1 || (echo Missing gnome-terminal && false)
	@which ctags > /dev/null 2>&1 || (echo Missing ctags && false)
	@which hasktags > /dev/null 2>&1 || (echo Missing hasktags && false)
	@which rst2ctags.py > /dev/null 2>&1 || (echo Missing rst2ctags.py && false)
	@which opam > /dev/null 2>&1 || (echo Missing opam && false)
	@which ocamlmerlin > /dev/null 2>&1 || (echo Missing ocamlmerlin && false)

	@echo All OK!

bundles:
	@echo "Building bundles"
	$(foreach b, $(BUNDLES), @echo "-> $b" && make -s -C bundle/$b;)

symlink:
	@test -e $(VIMRC) && echo Found existing vimrc, not creating symlink
	@test -e $(VIMRC) || (echo Creating vimrc symlink; ln -s $(PWD)/vimrc $(VIMRC))
	@test -e $(GVIMRC) && echo Found existing gvimrc, not creating symlink
	@test -e $(GVIMRC) || (echo Creating gvimrc symlink; ln -s $(PWD)/gvimrc $(GVIMRC))

.PHONY: all dependencies init bundles symlink
