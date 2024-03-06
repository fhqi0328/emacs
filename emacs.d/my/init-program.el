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


;;;;;;;;;;;;;;;;;;;;
(provide 'init-program)
