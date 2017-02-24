(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(setq
   helm-M-x-fuzzy-match t
   helm-buffers-fuzzy-matching t)

;; open a file in one of your projects and type a command such as C-c p f
(projectile-mode t)

;; (setq helm-projectile-fuzzy-match nil)
(require 'helm-projectile)

;; open a file in one of your projects and type a command such as C-c p h
(helm-projectile-on)

(provide 'init-helm)
