(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/spacemacs-theme")
(load-theme 'spacemacs-light t)

;; -----------------------------------------------------------------------------
;; setting font for mac system
;; -----------------------------------------------------------------------------
;; Setting English Font
(set-face-attribute
  'default nil :font "Monaco 14")
;; Chinese Font 配制中文字体
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "PingFang SC" :size 16)))

;; Note: you can chang "PingFang SC" to "Microsoft YaHei" or other fonts'))'))')
;; 中英字体 使用不同的字号, 实现中英文对齐

(provide 'init-theme)