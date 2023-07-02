;;;; 插件安装
(require 'package)
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("72ed8b6bffe0bfa8d097810649fd57d2b598deef47c992920aef8b5d9599eefe" default)))
 '(package-selected-packages
   (quote
    (markdown-mode company gruvbox-theme neotree go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;; 插件设置

;; go支持
(require 'go-mode)

;; 目录插件
(require 'neotree)
(global-set-key [f2] 'neotree-toggle)

;; company 补全插件
(add-hook 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 1
      company-tooltip-align-annotations t
      company-idle-delay 0.0
      company-show-numbers t
      company-selection-wrap-around t)



;;;; 快捷键设置
;; 使用C-u 替换C-x
(global-set-key (kbd "C-u") ctl-x-map)
;; C-u C-b 打开ibuffer
(global-set-key (kbd "C-u C-b") 'ibuffer)
;; 交换M-w/C-w
(global-set-key (kbd "M-w") 'kill-region)
(global-set-key (kbd "C-w") 'kill-ring-save)
;; 交换C-a/M-m
(global-set-key (kbd "C-a") 'back-to-indentation)
(global-set-key (kbd "M-m") 'move-beginning-of-line)


;;;; 编码设置
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;;;; 界面显示设置
;; 取消菜单栏/工具栏/滚动条
(menu-bar-mode 0)
(tool-bar-mode 0)
(when (display-graphic-p) (toggle-scroll-bar 0))

;; Emacs自带主题
;;(load-theme 'manoj-dark t)
(require 'gruvbox-theme)
(load-theme 'gruvbox-dark-medium)

;; 显示行号
(global-linum-mode 1)
(setq linum-format "%4d| ")

;; 显示时间
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time-mode 1)


;;;; 基础设置
;; 关闭文件自动备份,  不要后缀~的备份文件
(setq make-backup-files nil)

;; 自动加载
(global-auto-revert-mode t)

;; 高亮当前行
(global-hl-line-mode t)
(global-visual-line-mode 1)

;; 保存时删除多余空白字符
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; emacs可以与外部粘贴
(setq x-select-enable-clipboard t)

;; 鼠标支持
(xterm-mouse-mode t)

;;;; 编码设置
;; 缩进空格设置
(setq default-tab-width 4)
(setq indent-tabs-mode nil)

;; emacs 括号匹配/匹配高亮/对齐
(setq electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit)
(electric-pair-mode t)
(add-hook 'prog-mode-hook #'show-paren-mode)
(add-hook 'prog-mode-hook #'electric-pair-mode)
