(require 'org)
(require 'ob-core)
(require 'ob-shell)
(require 'ob-ruby)

(setq tangle/root "~/dotfiles/")

(load-file "./org-babel-config.el")
(remove-hook 'org-babel-pre-tangle-hook
             'save-buffer)

(with-current-buffer (find-file-noselect "./dotfiles.org")
  (let* ((current-dir (expand-file-name "."))
         (default-directory tangle/root)
         (tangle/emacs-config-dir (expand-file-name ".emacs.d/elisp/config" tangle/root))
         (tangle/emacs-sitelisp-dir (expand-file-name ".emacs.d/site-elisp" tangle/root))
         (tangle/local-bin-dir (expand-file-name ".local/bin/" tangle/root))
         (org-babel-tangle-use-relative-file-links nil)
         (python-indent-guess-indent-offset nil)
         (org-id-locations-file nil))
    (org-babel-lob-ingest)
    (org-decrypt-entries)
    (org-babel-tangle)))
