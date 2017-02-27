;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; gc-cons-threshold 指定了垃圾回收前允许有多少字节的consing
(setq gc-cons-threshold 200000000)

;; UTF-8 as default encoding
(set-language-environment "UTF-8")
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-site-lisp)
(require 'init-theme)
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-avy)
(require 'init-helm)
(require 'init-misc)
(require 'init-org)
(require 'init-windows)
(require 'init-which-key)
(require 'init-abbrev)
