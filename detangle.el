(require 'org)

(let ((src-files (seq-remove
                  (lambda (file)
                    (string-match-p (rx (or ".git/"
                                            (seq ".gpg" string-end)))
                                    file))
                  (directory-files-recursively
                   "~/ghq/github.com/p-snow/.files" "."))))
  (mapc #'org-babel-detangle src-files))
