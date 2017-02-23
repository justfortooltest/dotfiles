(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(setq
   helm-M-x-fuzzy-match t
   helm-buffers-fuzzy-matching t)

(provide 'init-helm)
