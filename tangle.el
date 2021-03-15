(require 'org)

(let* ((dotfiles-path (expand-file-name "./"))
       (org-files (directory-files dotfiles-path nil "\\.org\\(\\.gpg\\)?$")))
  (dolist (org-file org-files)
    (unless (member org-file '("README.org"))
      (mapc (lambda (tangled-file)
              (when (string-match-p "\\.password-store" tangled-file)
                (call-process-shell-command
                 (format "gpg -o %1$s -r %2$s -e %3$s; rm -f %3$s"
                         (concat tangled-file ".gpg")
                         user-full-name
                         tangled-file))))
            (org-babel-tangle-file (expand-file-name org-file dotfiles-path))))))
