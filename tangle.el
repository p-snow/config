(load-file "./common.el")

(require 'org)
(require 'org-crypt)
(require 'ob-shell)

(remove-hook 'org-babel-pre-tangle-hook
             'save-buffer)
(setq org-crypt-key user-mail-address)

(let* ((dotfiles-path (expand-file-name "./"))
       (org-files (directory-files dotfiles-path nil "\\.org\\(\\.gpg\\)?$"))
       (org-confirm-babel-evaluate nil)
       (python-indent-guess-indent-offset nil)
       (org-id-locations-file nil))
  (mapc (lambda (org-file)
          (org-babel-lob-ingest org-file))
        org-files)
  (dolist (org-file org-files)
    (unless (member org-file '("README.org"))
      (with-current-buffer (find-file-noselect org-file)
        (org-decrypt-entries)
        (mapc (lambda (target-file)
                (when (or (string-match-p "\\.password-store" target-file)
                          (string-match-p "\\.netrc" target-file))
                  (call-process-shell-command
                   (format "gpg -o %1$s -r %2$s -e %3$s; rm -f %3$s"
                           (concat target-file ".gpg")
                           user-full-name
                           target-file))))
              (mapcar #'expand-file-name (org-babel-tangle)))))))
