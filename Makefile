## -*- mode: makefile-gmake -*-

EMACS	  = emacs

TANGLE_EL = ./tangle.el

tangle: $(TANGLE_EL)
	$(EMACS) --quick --script $<

install:
	stow --target=$(HOME) --verbose .

uninstall:
	stow --delete --target=$(HOME) --verbose .

all: tangle install


.PHONY: install

### Makefile ends here
