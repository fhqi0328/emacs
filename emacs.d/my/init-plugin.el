;; Comment
;; 插件配置文件



(require 'package)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)
;; 如果连不上，使用国内源替代
(add-to-list 'package-archives '("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
(add-to-list 'package-archives '("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/") t)
(package-initialize)


(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))


(use-package eglot
  ;; eglot is an alternative minimal LSP implementation
  :ensure t
  :defer 1
  :bind(:map eglot-mode-map
             ("C-c C-d" . eldoc)
             ("C-c C-f" . eglot-code-action-quickfix)
             ("C-c C-e" . eglot-code-action-extract)
             ("C-c C-r" . eglot-code-action-rewrite)))

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


(use-package go-imenu
  ;; enhance imenu for go
  :ensure t
  :defer 1)


(use-package imenu-list
  ;; enhance imenu for go
  :ensure t
  :defer 1)


;; (use-package elpy
;;   ;; for python
;;   :ensure t
;;   :mode "\\.py\\'"
;;   :init
;;   (elpy-enable))


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


;; winner-mode(内置)
;; winner-undo/redo可以恢复/撤销窗口布局
(use-package winner-mode
  :ensure nil
  :hook (after-init . winner-mode))


;; saveplace(内置)
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))


;;;;;;;;;;;;;;;;;;;
(provide 'init-plugin)
