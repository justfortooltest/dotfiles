(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/spacemacs-theme")
(load-theme 'spacemacs-light t)

;; 让 org level 保持一样的字体和大小，同时也保证tag对齐
; (custom-set-faces
;    '(org-level-1 ((t (:inherit outline-1 :height 1.0 ))))
;    '(org-level-2 ((t (:inherit outline-2 :height 1.0 ))))
;    '(org-level-3 ((t (:inherit outline-3 :height 1.0 ))))
;    '(org-level-4 ((t (:inherit outline-3 :height 1.0 ))))
;    '(org-level-5 ((t (:inherit outline-3 :height 1.0 ))))
;    '(org-level-6 ((t (:inherit outline-3 :height 1.0 ))))
;    '(org-level-7 ((t (:inherit outline-3 :height 1.0 ))))
;    '(org-level-8 ((t (:inherit outline-3 :height 1.0 ))))
;    )

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
