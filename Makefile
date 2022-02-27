## -*- mode: makefile-gmake -*-

EMACS	  = emacs

TANGLE_EL	= ./tangle.el
DETANGLE_EL	= ./detangle.el
PUBLISH_EL	= ./publish.el

tangle: $(TANGLE_EL)
	$(EMACS) --quick --script $<

detangle: $(DETANGLE_EL)
	$(EMACS) --quick --script $<

install:
	stow --target=$(HOME) --verbose $(STOW_DIR)

uninstall: $(STOW_DIR)
	stow --delete --target=$(HOME) --verbose $(STOW_DIR)

publish: $(PUBLISH_EL)
	$(EMACS) --quick --script $<

all: tangle install


.PHONY: install

### Makefile ends here
