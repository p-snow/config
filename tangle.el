(require 'org)
(require 'ob-core)
(require 'ob-shell)
(require 'ob-python)
(require 'ob-ruby)

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
