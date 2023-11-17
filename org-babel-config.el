(with-eval-after-load 'ob-core
  (setq org-babel-noweb-error-all-langs t)
  (setopt org-babel-python-command (executable-find "python3"))
  (setopt org-babel-ruby-command (executable-find "ruby"))
  (setopt org-confirm-babel-evaluate nil)
  (setopt org-babel-load-languages '((shell      . t)
                                     (emacs-lisp . t)
                                     (python     . t)))
  (setf org-babel-default-header-args
        (append org-babel-default-header-args
                '((:mkdirp . t)
                  (:comments . "both")))))

(with-eval-after-load 'ob-shell
  (add-to-list 'org-babel-default-header-args:shell
               '(:shebang . "#!/bin/sh"))
  (add-to-list 'org-babel-default-header-args:bash
               '(:shebang . "#!/usr/bin/env bash\nset -euo pipefail\n")))

(with-eval-after-load 'ob-emacs-lisp
  (add-to-list 'org-babel-default-header-args:emacs-lisp
               `(:tangle-mode . ,(identity #o444))))

(with-eval-after-load 'ob-python
  (setf org-babel-default-header-args:python
        (append org-babel-default-header-args:python
                `((:tangle-mode . ,(identity #o555))
                  (:shebang . "#!/usr/bin/env python3")))))
