;; -- Comment --
;; 基本配置文件
;;

;;;;;;; 编码设置
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;; 关闭文件自动备份
(setq make-backup-files nil)

;; 自动加载
(global-auto-revert-mode t)

;; 支持高亮当前单词
(global-hi-lock-mode t)

;; 保存时删除多余空白字符
(add-hook 'before-save-hook 'delete-trailing-withspace)

;; 支持使用系统粘贴板(终端下)
(setq x-select-enable-clipboard t)

;; 鼠标支持(终端下)
(xterm-mouse-mode t)

;; 关闭警告声
(setq visible-bell 1)

;; 取消生成的auto-save-list目录
(setq auto-save-list-file-prefix nil)

;; 连续滚动
(setq scroll-step 1)
(setq scroll-margin 1)

;; 使用y/n 代替yes/no
(fset 'y-or-n-p 'yes-or-no-p)

;; 光标靠近鼠标时, 指针自动让开(GUI下)
(mouse-avoidance-mode 'animate)

;; 设置默认shell
(setq-default shell-file-name "/bin/bash")

;; 设置垃圾回收阈值，提升启动速度
(setq gc-cons-threshold (* 50 1000 1000))
(setq gc-cons-threshold (* 2 1000 1000))


;; 针对大文件，某一行特别长的情况
(require 'so-long)
(global-so-long-mode 1)

;; 选中文本后可以直接输入
(delete-selection-mode 1)


;;;;;;;;;;;;;;;;;;
(provide 'init-basic)
