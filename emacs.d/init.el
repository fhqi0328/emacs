;;;;;;; 编码设置
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;;;;;;; 插件安装
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
	use-package-expand-minimally t))
  
(use-package neotree
  :ensure t
  :bind ("<f2>" . neotree-toggle))

(use-package go-mode
  :ensure t
  :mode "\\.go\\'")

(use-package swiper
  ;; comment: for ivy
  :ensure t)

(use-package ivy-file-preview
  ;; comment: for ivy
  :ensure t)

(use-package ivy
  :ensure t
  :bind (("C-s" . swiper-isearch)
	 ("C-x b" . ivy-switch-buffer))
  :init (setq ivy-count-format "(%d/%d) "
              ivy-use-virtual-buffers t
              enable-recursive-minibuffers t)
  :config (ivy-mode 1))

(use-package company  
  :ensure t
  :commands company-mode
  :init (setq company-minimum-prefix-length 1
	      company-tooltip-align-annotations t
	      company-idle-delay 0.0
	      company-show-numbers t
	      company-selection-wrap-around t)
  :hook ((prog-mode . company-mode)
	 (text-mode . company-mode)))

(use-package gruvbox-theme
  ;; color theme
  :ensure t
  :config (load-theme 'gruvbox-dark-soft t))

;; (use-package flycheck
;;   :ensure t
;;   :init (global-flycheck-mode))


;;;;;;; 基础设置
;; 关闭文件自动备份
(setq make-backup-files nil)

;; 自动加载
(global-auto-revert-mode t)

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
(setq scroll-step 1
      scroll-margin 1)




;;;;;;; 外观设置
;; 取消菜单栏/工具栏/滚动条
(menu-bar-mode 0)
(tool-bar-mode 0)
(when (display-graphic-p)
  (toggle-scroll-bar 0))

;; 显示行号
(global-linum-mode 1)
(setq linum-format "%4d|")

;; Emacs主题
;;(load-theme 'manoj-dark t)
(load-theme 'gruvbox t)

;; 高亮当前行
(global-hl-line-mode t)
(global-visual-line-mode 1)

;; 设置字体
(set-face-font 'default "Cascadia Mono")

;; 取消欢迎界面
(setq inhibit-startup-screen t)


;;;;;;; 编程设置
;; tab设置
(setq default-tab-width 4)
(setq indent-tabs-mode nil)

;; 显示括号匹配
(show-paren-mode 1)



;;;;;;; 快捷键设置
;; sh-mode-map下的快捷键
(with-eval-after-load "sh-script"
  (define-key sh-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
  (define-key sh-mode-map (kbd "C-c C-s") 'project-find-regexp)
  (define-key sh-mode-map (kbd "C-c C-f") 'project-find-file))


;; 使用ibuffer替换原buffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; 使用C-x C-w切换窗口
(global-set-key (kbd "C-x C-a") 'other-window)
;; 使用C-c C-c注释/取消注释
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)
;; 使用C-c C-s在项目中正则搜索文本
(global-set-key (kbd "C-c C-s") 'project-find-regexp)
;; 使用C-c C-f在项目中搜索文件
(global-set-key (kbd "C-c C-f") 'project-find-file)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7b8f5bbdc7c316ee62f271acf6bcd0e0b8a272fdffe908f8c920b0ba34871d98" default))
 '(package-selected-packages '(flycheck gruvbox-theme ivy go-mode neotree use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
