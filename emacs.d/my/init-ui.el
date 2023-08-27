;; Comment
;; 外观配置文件


;; 取消菜单栏/工具栏/滚动条
(menu-bar-mode 0)
(tool-bar-mode 0)
(when (display-graphic-p)
  (toggle-scroll-bar 0))

;; 显示行号
(global-linum-mode 1)
(setq linum-format "%3d|")

;; 显示列号
(column-number-mode t)

;; 高亮当前行
(global-hl-line-mode t)
(global-visual-line-mode 1)

;; 设置字体
(set-face-font 'default "Cascadia Mono")

;; 取消欢迎界面
(setq inhibit-startup-screen t)

;; 显示时间
(display-time-mode t)



;; 显示列线
;; 通过set-fill-column指定, 快捷键C-x f
;; (global-display-fill-column-indicator-mode t)



;;;;;;;;;;;;;;;;
(provide 'init-ui)
