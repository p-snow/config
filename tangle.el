(require 'org)
(require 'org-crypt)
(require 'ob-shell)

(defun expand-tangle-target (file)
  "docstring"
  (let* ((target-dir (expand-file-name (org-entry-get nil "tangle-target-dir" t))))
    (expand-file-name file target-dir)))

(remove-hook 'org-babel-pre-tangle-hook
             'save-buffer)
(setq org-crypt-key user-mail-address)

(let* ((dotfiles-path (expand-file-name "./"))
       (org-files (directory-files dotfiles-path nil "\\.org\\(\\.gpg\\)?$"))
       (org-confirm-babel-evaluate nil)
       (python-indent-guess-indent-offset nil))
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
