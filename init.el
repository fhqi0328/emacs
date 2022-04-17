;;; package: ---- summary
;;; Commentary:
;;; init.el --- load the full configuratin
;;; Code:


;;;;;; 启动时先加载use-package
;;(eval-when-compile
;;   (require 'use-package))

;;;;;; 包管理
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)


;; 增强好多基础功能
(use-package ivy
  :ensure t
  :diminish ivy-mode
  :hook (after-init . ivy-mode))

(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
	 ("\C-x \C-f" . counsel-find-file)))

;; 方便切换窗口
(use-package ace-window
  :ensure t
  :bind (("C-x o" . 'ace-window)))

;; ;; 语法检查
(use-package flycheck
  :ensure t
  :hook
  (prog-mode . flycheck-mode))


;; 目录树
(use-package neotree
  :ensure t
  :bind (("<f2>" . neotree-toggle)))

(use-package use-package-ensure-system-package
  :ensure t)

;; go插件
(use-package go-mode
  ;; :load-path "~/.emacs.d/vendor/go-mode"
  :mode ("\\.go\\'" . go-mode)
  :ensure-system-package
  ((goimports . "go get -u golang.org/x/tools/cmd/goimports")
   (godef . "go get -u github.com/rogpeppe/godef"))
  :init
  (setq gofmt-command "goimports"
        indent-tabs-mode t)
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)
  :bind (:map go-mode-map
              ("\C-c \C-c" . compile)
              ("\C-c \C-g" . go-goto-imports)
              ("\C-c \C-k" . godoc)
              ("M-j" . godef-jump)))


;;;; 基础配置
;; 编码设置为UTF-8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


;; 括号匹配，对齐，补全
(electric-pair-mode t)
(electric-indent-mode t)
(electric-pair-mode t)
(electric-layout-mode t)

;; 高亮括号
(add-hook 'prog-mode-hook #'show-paren-mode)

;; 显示行号
(global-linum-mode t)
(setq linum-format "%3d| ")

;; 高亮光标所在行
(global-hl-line-mode t)

;; 保存时删除多余空白字符
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; 当另一程序修改文件时，自动load
(global-auto-revert-mode t)

;; 选中文本后输入，会替换文本
(delete-selection-mode t)

;; 关闭启动界面
(setq inhibit-startup-message t)

;; 关闭文件自动备份
(setq make-backup-files nil)

;; 关才tool bar
(tool-bar-mode -1)

;; 关闭滚动条
(when (display-graphic-p) (toggle-scroll-bar -1))

;; y/n 代替yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; 关闭出错时的提示声
(setq visible-bell t)

;; 设置tab为4个空格的宽度
(setq default-tab-width 4)

;; 支持emacs与外部程序粘贴
(setq x-select-enable-clipboard t)

;; 语法高亮
(global-font-lock-mode t)

;; 显示时间
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time-mode 1)

;; 设置主题(自带的)
(load-theme 'manoj-dark t)

;; 终端下支持鼠标
(xterm-mouse-mode t)

;;;;;; 快捷键设置

;; M-g 跳转到某一行
(global-set-key [(meta g)] 'goto-line)

;; 使用ibuffer代替默认的list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)



(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(use-package-ensure-system-package go-mode use-package smart-mode-line neotree ivy good-scroll flycheck elpy ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
