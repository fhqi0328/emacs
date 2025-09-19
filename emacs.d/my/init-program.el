;; Comment
;; 编程配置文件
;;

(setq default-tab-width 4)
(setq indent-tabs-mode t)

(setq c-default-style "linux")
(setq c-basic-offset 4)


;; python设置
;;;; python缩进设置
(set-variable 'python-indent-offset 4)
(set-variable 'python-indent-guess-indent-offset nil)


;; 显示括号匹配
(show-paren-mode 1)

;; 括号自动补全(不习惯)
;; (electric-pair-mode t)

;; 使用空格, 不使用tabs
(setq-default indent-tabs-mode nil)

;; 开启completion-preview-mode
(setq global-completion-preview-mode t)


;; flymake
;; 直接在行末显示错误信息
;; (终端下，会影响补全窗口弹出位置)
;; (setq flymake-show-diagnostics-at-end-of-line 'short)


;; 设置复用窗口
;; (setq display-buffer-reuse-frames t)


;; 编程几个常用的内置功能
(add-hook 'prog-mode-hook 'column-number-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'flymake-mode)




;;;;;;;;;;;;;;;;;;;;
(provide 'init-program)
