(require 'org)
(require 'ob-shell)

(remove-hook 'org-babel-pre-tangle-hook
             'save-buffer)

(let* ((org-files (directory-files "./" nil "\\.org$"))
       (org-confirm-babel-evaluate nil)
       (python-indent-guess-indent-offset nil)
       (org-id-locations-file nil))
  (mapc (lambda (org-file)
          (org-babel-lob-ingest org-file))
        org-files)
  (dolist (org-file org-files)
    (unless (member org-file '("README.org" "index.org"))
      (princ org-file)
      (with-current-buffer (find-file-noselect org-file)
        (let ((default-directory (org-entry-get nil "tangle-dest" t)))
          (org-babel-tangle))))))
