((org-mode
  . ((eval . (let* ((root (locate-dominating-file default-directory ".dir-locals.el"))
                    (org-dir (expand-file-name "org" root)))
               (setq-local org-publish-project-alist
                           `(("qiuc-page"
                              :base-directory ,org-dir
                              :base-extension "org"
                              :publishing-directory ,root
                              :publishing-function org-gfm-publish-to-gfm
                              :recursive t))))))))
