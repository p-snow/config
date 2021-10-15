(load-file "./common.el")

(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(package-install 'htmlize)

(require 'ox-publish)

(setq make-backup-files nil)

(setq org-export-with-broken-links 'mark)

(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")

(setq org-publish-project-alist
      (list
       (list "org-site:main"
             :recursive nil
             :base-directory "."
             :publishing-function 'org-html-publish-to-html
             :publishing-directory "./public"
             :exclude "README.org"
             :auto-sitemap t
             :sitemap-filename "index.org"
             :sitemap-title "My Dotfiles"
             :with-author nil
             :with-creator t
             :with-toc t
             :section-numbers nil
             :time-stamp-file nil)))

(org-publish-all t)

(message "Build complete!")
