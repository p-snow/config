(require 'org)
(require 'ob-core)
(require 'ob-shell)
(require 'ob-ruby)

;; top directory for all tangled files
(setq tangle/home "~/data/ghq/github.com/p-snow/dotfiles/")

(setq tangle/user-emacs-directory (expand-file-name ".config/emacs" tangle/home)
      tangle/emacs-sitelisp-dir (expand-file-name "site-lisp" tangle/user-emacs-directory)
      tangle/emacs-config-dir (expand-file-name "lisp" tangle/user-emacs-directory)
      tangle/emacs-etc-dir (expand-file-name "etc" tangle/user-emacs-directory)
      tangle/emacs-var-dir (expand-file-name "var" tangle/user-emacs-directory)
      tangle/local-bin-dir (expand-file-name ".local/bin/" tangle/home)
      tangle/proj-dir (expand-file-name "./"))

;; (load-file (expand-file-name "org-babel-config.el" tangle/emacs-config-dir))
(load-file "./org-babel-config.el")
(remove-hook 'org-babel-pre-tangle-hook
             'save-buffer)

(with-current-buffer (find-file-noselect "./dotfiles.org")
  (let* ((default-directory tangle/home)
         (org-babel-tangle-use-relative-file-links nil)
         (python-indent-guess-indent-offset nil)
         (org-id-locations-file nil))
    (org-babel-lob-ingest)
    (org-decrypt-entries)
    (org-babel-tangle)))
