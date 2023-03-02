((nil . ((compile-command . "make tangle")
         (magit-wip-mode . t)))
 (org-mode . ((auto-save-visited-mode . nil)
              (eval . (add-hook 'after-save-hook
                                #'my/compile-default-command nil t)))))
