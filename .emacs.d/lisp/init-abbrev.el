;; Tips:  expand abbrev by c-x '

;; abbrev-mode
;; I put “z” in the beginning of my abbrevs. This way, i don't have to worry about clash with short words that i don't want to expand.
(setq abbrev-file-name "~/org/abbrev_defs.el")    ;; definitions from...

(setq save-abbrevs 'silently)

(if (file-exists-p abbrev-file-name)
  (quietly-read-abbrev-file))       ;; reads the abbreviations file

(dolist (hook '(erc-mode-hook
                 emacs-lisp-mode-hook
                 text-mode-hook))
  (add-hook hook (lambda () (abbrev-mode 1))))

(provide 'init-abbrev)
