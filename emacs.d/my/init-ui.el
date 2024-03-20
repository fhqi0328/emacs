;; Comment
;; 外观配置文件


;; 取消菜单栏/工具栏/滚动条
(menu-bar-mode 0)
(tool-bar-mode 0)
(when (display-graphic-p)
  (toggle-scroll-bar 0))


;; 显示行号
(global-display-line-numbers-mode t)
(setq linum-format "%3d| ")


;; 显示列号
(column-number-mode t)


;; 高亮当前行
(global-hl-line-mode t)
(global-visual-line-mode 1)


;; 设置字体
;; (set-face-font 'default "Cascadia Mono")

;; 取消欢迎界面
(setq inhibit-startup-screen t)

;; 显示时间
(display-time-mode t)


;; 主题
;; (load-theme 'wombat t)
;; (load-theme 'gruvbox t)
(load-theme 'modus-vivendi t)



;;;;;;;;;;;;;;;;
(provide 'init-ui)
