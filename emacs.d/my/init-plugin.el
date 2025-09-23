;;; package --- Package:
;;; Commentary:
;;; 插件配置文件


;; 插件下载优先使用默认
;; 如果默认下载失败，使用清华源
;; 如果清华源连接不上端口443，临时改为http


(require 'package)
;; 默认源
;; (setq package-archives
;;       '(("gnu" . "https://melpa.org/packages/")
;;      ("melpa" . "https://elpa.gnu.org/packages/")))
;; 清华源
(setq package-archives
      '(("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
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
  (add-hook 'go-mode-hook 'auto-highlight-symbol-mode)
  (add-hook 'go-mode-hook 'eglot-ensure))



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
         (go-mode-hook . company-mode)
         (python-mode . company-mode)))


;; 高亮当前符号
(use-package auto-highlight-symbol
  :ensure t
  :defer 1
  :init (global-auto-highlight-symbol-mode t))


;; saveplace(内置)
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))


;; which-key(内置)
(use-package which-key
  :ensure nil
  :config (which-key-mode))


;; tree-sitter(内置)
;; 语言的语法解析器
;; (use-package treesit
;;   :ensure nil
;;   :when (and (fboundp 'treesit-available-p)
;;              (treesit-available-p))
;;   :config (setq treesit-font-lock-level 4)
;;   :init
;;   (setq treesit-language-source-alist
;;         '((go . ("https://github.com/tree-sitter/tree-sitter-go"))
;;           (python . ("https://github.com/tree-sitter/tree-sitter-python"))))
;;   (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
;;   (add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode)))


;; 五笔插件
(use-package chinese-wbim
  :ensure t
  :defer 1
  :init (register-input-method "chinese-wbim" "euc-cn" 'chinese-wbim-use-package "五笔" "汉字五笔输入法" "wb.txt"))


;;;;;;;;;;;;;;;;;;;
(provide 'init-plugin)

;;; init-plugin.el ends here
