(require 'org)

(remove-hook 'org-babel-pre-tangle-hook
             'save-buffer)

(let* ((dotfiles-path (expand-file-name "./"))
       (org-files (directory-files dotfiles-path nil "\\.org\\(\\.gpg\\)?$")))
  (dolist (org-file org-files)
    (unless (member org-file '("README.org"))
      (with-current-buffer (find-file-noselect org-file)
        (org-decrypt-entries)
        (mapc (lambda (target-file)
                (when (string-match-p "\\.password-store" target-file)
                  (call-process-shell-command
                   (format "gpg -o %1$s -r %2$s -e %3$s; rm -f %3$s"
                           (concat target-file ".gpg")
                           user-full-name
                           target-file))))
              (mapcar #'expand-file-name (org-babel-tangle)))))))
