((nil . ((compile-command . "make tangle")))
 (org-mode . ((auto-save-visited-mode . nil)
              (eval . (add-hook 'after-save-hook
                                #'my/compile-default-command nil t)))))
