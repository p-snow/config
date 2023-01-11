## -*- mode: makefile-gmake -*-

EMACS	  = emacs

TANGLE_EL	= ./tangle.el
DETANGLE_EL	= ./detangle.el
PUBLISH_EL	= ./publish.el
EARLYINIT_EL	= ~/.emacs.d/early-init.el

tangle: $(TANGLE_EL) $(EARLYINIT_EL)
	@git config --local core.hooksPath git-hooks
	$(EMACS) -Q --batch -l $(word 2,$^) -l $<

detangle: $(DETANGLE_EL) $(EARLYINIT_EL)
	$(EMACS) -Q --batch -l $(word 2,$^) -l $<

publish: $(PUBLISH_EL) $(EARLYINIT_EL)
	$(EMACS) -Q --batch -l $(word 2,$^) -l $<

all: tangle


### Makefile ends here
