## -*- mode: makefile-gmake -*-

EMACS	  = emacs

TANGLE_EL	= ./tangle.el
DETANGLE_EL	= ./detangle.el
PUBLISH_EL	= ./publish.el

tangle: $(TANGLE_EL)
	$(EMACS) --quick --script $<

detangle: $(DETANGLE_EL)
	$(EMACS) --quick --script $<

publish: $(PUBLISH_EL)
	$(EMACS) --quick --script $<

all: tangle


### Makefile ends here
