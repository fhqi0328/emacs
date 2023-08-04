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
  ;; like NERDTree in Vim
  :ensure t
  ;; load after 1 second of idle time
  :defer 1
  :bind ("<f2>" . neotree-toggle))

(use-package go-mode
  ;; support go
  :ensure t
  :defer 1
  :mode "\\.go\\'"
  :init (add-hook 'before-save-hook #'gofmt-before-save))

(use-package swiper
  ;; comment: for ivy
  :ensure t
  :defer 1)

(use-package ivy-file-preview
  ;; comment: for ivy
  :ensure t
  :defer 1)

(use-package ivy
  :ensure t
  :defer 1
  :bind (("C-s" . swiper-isearch)
	 ("C-r" . swiper-isearch-backward)
	 ("C-x C-f" . counsel-find-file)
	 ("C-x b" . ivy-switch-buffer))
  :init (setq ivy-count-format "(%d/%d) "
              ivy-use-virtual-buffers t
              enable-recursive-minibuffers t)
  :config (ivy-mode 1))

(use-package company
  :ensure t
  :defer 1
  :commands company-mode
  :init (setq company-minimum-prefix-length 1
	      company-tooltip-align-annotations t
	      company-idle-delay 0.0
	      company-show-numbers t
	      company-selection-wrap-around t)
  :hook ((prog-mode . company-mode)
	 (text-mode . company-mode)))

;; (use-package gruvbox-theme
;;   ;; color theme
;;   :ensure t
;;   :config (load-theme 'gruvbox-dark-hard t))


(use-package monokai-theme
  ;; monokai color theme
  :ensure t
  :config (load-theme 'monokai t))


;;;;;;;; 基础设置
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


;;;;;;; 外观设置
;; 取消菜单栏/工具栏/滚动条
(menu-bar-mode 0)
(tool-bar-mode 0)
(when (display-graphic-p)
  (toggle-scroll-bar 0))

;; 显示行号
(global-linum-mode 1)
(setq linum-format "%4d|")

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

;; 主题设置
;; (load-theme 'wombat t)
;; (load-theme 'leuven t)

;; 显示列线
;; 通过set-fill-column指定, 快捷键C-x f
;; (global-display-fill-column-indicator-mode t)



;;;;;;; 编程设置
;; tab设置
(setq default-tab-width 4)
(setq indent-tabs-mode t)

;; 显示括号匹配
(show-paren-mode 1)


;;;;;;; 快捷键设置
;; 使用ibuffer替换原buffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; M-g 跳转到指定行
(global-set-key (kbd "M-g") 'goto-line)

;; 使用C-2或C-@ 进行set mark
(global-set-key (kbd "C-2") 'set-mark-command)

;; 使用C-o切换窗口
(global-set-key (kbd "C-o") 'other-window)

;; 使用ctrl-<backspace> to kill word, not working when ssh
(global-set-key (kbd "C-<DEL>") 'backward-kill-word)

;; 使用<F8>注释/取消注释
(global-set-key (kbd "<f8>") 'comment-or-uncomment-region)

;; 使用Ctrl-x p s => project-find-regexp
(global-set-key (kbd "C-x p s") 'project-find-regexp)
;; 使用Ctrl-x p f => project-find-file
(global-set-key (kbd "C-x p f") 'project-find-file)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(monokai-theme use-package neotree ivy-file-preview gruvbox-theme goto-chg go-mode counsel company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
