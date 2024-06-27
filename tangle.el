(require 'org)
(require 'org-crypt)
(require 'ob-core)
(require 'ob-shell)
(require 'ob-python)
(require 'ob-ruby)

(setf tangle/home "~/environment/home")

(setf tangle/system (file-name-concat tangle/home "../system")
      tangle/config-dir (file-name-concat tangle/home ".config")
      tangle/user-emacs-directory (file-name-concat tangle/config-dir "emacs")
      tangle/emacs-sitelisp-dir (file-name-concat tangle/user-emacs-directory "site-lisp")
      tangle/emacs-config-dir (file-name-concat tangle/user-emacs-directory "lisp")
      tangle/emacs-etc-dir (file-name-concat tangle/user-emacs-directory "etc")
      tangle/local-bin-dir (file-name-concat tangle/home ".local/bin/")
      tangle/dedicated-elisp-dir
      (file-name-concat tangle/user-emacs-directory "lisp/dedicated")
      tangle/dedicated-template-dir
      (file-name-concat tangle/emacs-etc-dir "tempel/templates/dedicated"))

(remove-hook 'org-babel-pre-tangle-hook
             'save-buffer)

(with-current-buffer (find-file-noselect "./dotfiles.org")
  (let* ((default-directory tangle/home)
         (org-babel-tangle-use-relative-file-links nil)
         (python-indent-guess-indent-offset nil)
         (org-id-locations-file nil)
         (org-babel-tangle-remove-file-before-write t))
    (org-babel-lob-ingest)
    (unwind-protect (org-decrypt-entries)
      (org-babel-tangle))))
