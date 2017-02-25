;; 显示行数和列数
(column-number-mode 1)

;; 设置标题
(setq frame-title-format "%b -- Just Writing")

;; 隐藏菜单栏 工具栏 滚动条
; (menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; y代替yes
(fset 'yes-or-no-p 'y-or-n-p)

;; recentf 最近打开过的文件
(recentf-mode 1)
(setq recentf-max-saved-items 500)

;; 用空格代替tab来进行代码的缩进
(setq-default indent-tabs-mode nil
              tab-width 2)

;; 打开大文件时不必警告
(setq large-file-warning-threshold nil)

;; 当选中内容时，输入新内容则会替换掉,启用delete-selection-mode
(delete-selection-mode 1)

;; 关闭烦人的出错时的提示声
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; 输入括号时 自动添加半边括号的功能
(electric-pair-mode t)

;; 不使用对话框进行（是，否 取消,打开文件） 的选择，而是用minibuffer
(setq-default use-dialog-box nil)

;; 关闭启动显示界面
(setq inhibit-startup-message t)

;; 默认的 *scratch* buffer 里面会有一段下面的内容，
;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.
;; 默认不想显示此内容，则这样设置
(setq initial-scratch-message nil)

;; make buffer switch command auto suggestions, also for find-file command
(ido-mode 1)

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

(provide 'init-misc)
