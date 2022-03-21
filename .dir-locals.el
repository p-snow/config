((nil . ((compilation-directory "./")
         (compile-command . "make tangle")))
 (org-mode . ((eval . (defun dotfiles/compile ()
                        "Compile this repository and conceal compilation buffer."
                        (let ((compilation-directory "./"))
                          (funcall #'compile "make tangle")
                          (quit-window))))
              (eval . (add-hook 'after-save-hook
                                #'dotfiles/compile nil t)))))
