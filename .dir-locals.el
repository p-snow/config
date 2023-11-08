((nil . ((compile-command . "make tangle")
         (project-vc-merge-submodules . nil)))
 (org-mode . ((auto-save-visited-mode . nil)
              (eval . (add-hook 'after-save-hook
                                #'my/compile-default-command nil t))
              (eval . (remove-hook 'find-file-hook
                                   (lambda () (setq-local buffer-save-without-query t)))))))
