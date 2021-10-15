(defun expand-tangle-target (file)
  "Expand tangled file path to be absolute."
  (let* ((target-dir (expand-file-name (org-entry-get nil "tangle-target-dir" t))))
    (expand-file-name file target-dir)))
