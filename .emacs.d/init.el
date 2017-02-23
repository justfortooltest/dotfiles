;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-site-lisp)
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-helm)
(require 'init-windows)
(require 'init-which-key)

;; UTF-8 as default encoding
(set-language-environment "UTF-8")

;; make buffer switch command auto suggestions, also for find-file command
(ido-mode 1)

; keep a list of recently opened files
(recentf-mode 1)

(global-set-key [?\C-h] 'delete-backward-char)
(global-set-key [?\C-x ?h] 'help-command)
                         ;; overrides mark-whole-buffer')')

(setq
 backup-by-copying t    ;自动备份
 delete-old-versions t ; 自动删除旧的备份文件
 kept-new-versions 10   ; 保留最近的10个备份文件
 kept-old-versions 2   ; 保留最早的2个备份文件
 version-control t    ; 多次备份
 ;; 把生成的备份文件放到统一的一个目录,而不在在文件当前目录生成好多 ~ #的文件
 ;; 如果你编辑某个文件时 后悔了想恢复成以前的一个版本 你可以到这个目录下
 ;; 找到备份的版本
 backup-directory-alist `((".*" . "~/.emacs.d/cache/backup_files/")) ;
 auto-save-file-name-transforms `((".*" "~/.emacs.d/cache/backup_files/" t))
 auto-save-list-file-prefix   "~/.emacs.d/cache/backup_files/saves-")

(eval-after-load "org"
  '(require 'ox-md nil t))

(require 'ox-latex)

(add-hook 'org-mode-hook
      (lambda ()
        (add-to-list 'org-latex-classes
             '("ctexart"
               "\\documentclass{ctexart}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-latex-pdf-process
   (quote
    ("xelatex -interaction nonstopmode -output-directory %o %f" "xelatex -interaction nonstopmode -output-directory %o %f" "xelatex -interaction nonstopmode -output-directory %o %f"))))
(org-babel-do-load-languages
  'org-babel-load-languages
  '(
    (sh . t)
    (python . t)
    (R . t)
    (ruby . t)
    (ditaa . t)
    (dot . t)
    (octave . t)
    (sqlite . t)
    (perl . t)
    (C . t)
    ))

