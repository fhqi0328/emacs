(add-to-list 'load-path "~/.emacs.d/my/")
(require 'init-basic)
(require 'init-ui)
(require 'init-plugin)
(require 'init-program)
(require 'init-hotkey)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yasnippet use-package pkg-info ivy-file-preview hl-todo highlight-indentation gruvbox-theme goto-chg go-mode counsel company annalist)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
