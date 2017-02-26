;; Tips:
;; 1. expand abbrev by c-x '
;; 2. c-q 可以不使用abbrev
;; 3. I put “z” in the beginning of my abbrevs. This way, i don't have to worry about clash with short words that i don't want to expand.

;; abbrev-mode
(setq abbrev-file-name "~/org/abbrev_defs.el")    ;; definitions from...

(setq save-abbrevs 'silently)

(if (file-exists-p abbrev-file-name)
  (quietly-read-abbrev-file))       ;; reads the abbreviations file

; 不自动开启 abbre-mode，而是通过 c-x ' 补全
; (dolist (hook '(erc-mode-hook
;                  emacs-lisp-mode-hook
;                  text-mode-hook))
;   (add-hook hook (lambda () (abbrev-mode 1))))

(provide 'init-abbrev)
