(require 'org)

(let* ((dotfiles-path (expand-file-name "./"))
       (org-files (directory-files dotfiles-path nil "\\.org$")))
  (dolist (org-file org-files)
    (unless (member org-file '("README.org"))
      (org-babel-tangle-file (expand-file-name org-file dotfiles-path)))))
