## -*- mode: makefile-gmake -*-

EMACS	  = emacs

TANGLE_EL	= ./tangle.el
DETANGLE_EL	= ./detangle.el
PUBLISH_EL	= ./publish.el
BLOG_EL	= ./blog.el
EARLYINIT_EL	= ~/.config/emacs/early-init.el
BABEL_CONF_EL	= ~/.config/emacs/lisp/org-babel-config.el

tangle: $(TANGLE_EL) $(EARLYINIT_EL) $(BABEL_CONF_EL)
	@git config --local core.hooksPath git-hooks
	$(EMACS) -Q --batch -l $(word 2,$^) -l $(word 3,$^) -l $<

publish: $(PUBLISH_EL)
	$(EMACS) -Q --batch -l $<

blog: $(BLOG_EL)
	$(EMACS) -Q --batch -l $<

.PHONY: tangle

### Makefile ends here
