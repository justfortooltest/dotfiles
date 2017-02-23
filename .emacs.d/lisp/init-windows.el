(require 'window-numbering)

;; shift with arrow key move cursor point in another window
(windmove-default-keybindings)

;; window numbering
(window-numbering-mode 1)

;; save/restore opened files and windows config
(desktop-save-mode 1) ; 0 for off

;; window undo redo
(winner-mode t)

(provide 'init-windows)
