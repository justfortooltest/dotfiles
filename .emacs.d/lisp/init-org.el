(add-to-list 'auto-mode-alist '("\\.org\\’" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t
      org-startup-truncated nil ;; 在 org mode 模式下段落随着窗口大小换行
      )

;; Note: 如果需要导出 epub/mobi...可以先导出markdown然后通过pandoc转换
;; 先转换成 epub, 然后可以通过 calibre 转换你想要的格式
(eval-after-load "org"
  '(require 'ox-md nil t))

;; Capture, org 文件夹可以使用云同步
(define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Org/gtd.org" "Tasks")
         "* TODO %?\n %i\n \n \n \n \n")
        ("i" "Idea" entry (file+headline "~/Org/notes.org" "Ideas")
         "* %?\n Caught on %T\n %i\n \n \n \n \n")
        ("m" "Movie" entry (file+headline "~/Org/notes.org" "Entertainments")
         "* %?\n Watched on %T\n %i\n \n \n \n \n")
        ("n" "Note" entry (file+headline "~/Org/notes.org" "Notes")
         "* %?\n Taken at %T\n %i\n \n \n \n \n")
        ("j" "Journal" entry (file+datetree "~/Org/journal.org")
         "** %?\n Logged at %T\n %i\n \n \n \n \n")))

(provide 'init-org)
