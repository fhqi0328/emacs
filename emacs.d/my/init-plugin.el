;; Comment
;; 插件配置文件



(require 'package)
(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
			 ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("elpa"   . "http://elpa.gnu.org/packages/")))
(package-initialize)


(eval-and-compile
  (setq use-package-always-ensure t
	use-package-expand-minimally t))


(use-package eglot
  ;; eglot is an alternative minimal LSP implementation
  :ensure t
  :defer 1
  :bind(:map eglot-mode-map
	     ("C-c C-d" . eldoc)))

(use-package go-mode
  ;; support go
  :ensure t
  :defer 1
  :mode "\\.go\\'"
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook 'eglot-ensure)
  (add-hook 'go-mode-hook 'company-mode))


(use-package swiper
  ;; comment: for ivy
  :ensure t
  :defer 1)

(use-package counsel
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
	 ("C-x b" . ivy-switch-buffer)
	 ("C-M-j" . ivy-immediate-done))
  :init (setq ivy-count-format "(%d/%d) "
	      ivy-use-virtual-buffers t
	      enable-recursive-minibuffers t)
  :config (ivy-mode 1))


(use-package gruvbox-theme
  ;; color theme
  :ensure t)


(use-package rust-mode
  ;; rust mode
  :ensure t
  :mode "\\.rs\\'"
  :init (setq rust-format-on-save t))


(use-package go-imenu
  ;; enhance imenu for go
  :ensure t
  :defer 1)


(use-package imenu-list
  ;; enhanced
  :ensure t
  :defer 1)


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
	 (text-mode . company-mode)
	 (c-mode-hook . company-mode)
	 (c++-mode-hook . company-mode)
	 (python-mode . company-mode)))




;;;;;;;;;;;;;;;;;;;
(provide 'init-plugin)
