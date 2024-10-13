(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; (package-install 'htmlize)
(package-install 'org-static-blog)

(require 'ox-publish)

(setq make-backup-files nil)


(require 'org-static-blog)
(setq org-static-blog-publish-title "ティンカラー日記")
(setq org-static-blog-publish-url "https://www.p-snow.org/config/diary")
(setq org-static-blog-publish-directory "./public/diary/")
(setq org-static-blog-posts-directory "./diary/posts/")
(setq org-static-blog-drafts-directory "./diary/drafts/")
(setq org-static-blog-enable-tags t)
(setq org-static-blog-use-preview t)
(setq org-static-blog-preview-start "<preview>")
(setq org-static-blog-preview-end "</preview>")
(setq org-static-blog-preview-ellipsis "(read more...)")
(setq org-static-blog-preview-link-p t)
(setq org-static-blog-page-header
      (concat "<meta charset=\"utf-8\">"
              "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">"
              "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
              "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.css\">"
              "<link rel=\"stylesheet\" href=\"./assets/css/style.css\">"))
(setq org-static-blog-page-preamble
      (concat "<header><nav>"
              "<a href=\"https://www.p-snow.org/config/diary\">ホーム</a>"
              "<a href=\"https://www.p-snow.org/config/diary/about.html\">こなゆき</a>"
              "<a href=\"https://www.p-snow.org/config/diary/rss.xml\">RSS</a>"
              "</nav><h1>ティンカラー日記</h1><p>こなゆき</p></header>"))
(setq org-static-blog-no-post-tag "nonpost")
(setq org-static-blog-rss-excluded-tag "nonrss")

(setq org-export-with-toc nil)
(setq org-export-with-section-numbers nil)
(setq org-export-with-broken-links 'mark
      org-export-use-babel nil)

(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")

(org-static-blog-publish-file "./diary/drafts/about.org")
(org-static-blog-publish)

(message "Build complete!")
