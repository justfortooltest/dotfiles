(eval-after-load "org"
  '(require 'ox-md nil t))

;; Note: 如果需要导出 epub/mobi...可以先导出markdown然后通过pandoc转换
;; 先转换成 epub, 然后可以通过 calibre 转换你想要的格式

(provide 'init-org)
