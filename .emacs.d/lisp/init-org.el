(add-to-list 'auto-mode-alist '("\\.org\\’" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-log-done t ;; CLOSED:[timestamp]
      org-startup-truncated nil ;; 在 org mode 模式下段落随着窗口大小换行
      org-odt-preferred-output-format "doc" ;; 导出 odt 格式为 doc
      org-tags-column 80 ;; 设置tags保持多少column, 同level tag 对齐
      org-completion-use-ido t
      )

(setq org-goto-interface 'outline-path-completion
      org-goto-max-level 10)

(setq org-outline-path-complete-in-steps nil)

;; Note: 如果需要导出 epub/mobi...可以先导出markdown然后通过pandoc转换
;; 先转换成 epub, 然后可以通过 calibre 转换你想要的格式
(eval-after-load "org"
  '(require 'ox-md nil t))

;; Capture, org 文件夹可以使用云同步
(define-key global-map "\C-cc" 'org-capture)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Tasks")
         "* TODO %?\n %i\n \n \n \n \n")
        ("i" "Idea" entry (file+headline "~/org/notes.org" "Ideas")
         "* %?\n Caught on %T\n %i\n \n \n \n \n")
        ("m" "Movie" entry (file+headline "~/org/notes.org" "Entertainments")
         "* %?\n Watched on %T\n %i\n \n \n \n \n")
        ("n" "Note" entry (file+headline "~/org/notes.org" "Notes")
         "* %?\n Taken at %T\n %i\n \n \n \n \n")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "** %?\n Logged at %T\n %i\n \n \n \n \n")))
(provide 'init-org)
