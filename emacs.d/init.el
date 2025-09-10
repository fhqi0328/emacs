(add-to-list 'load-path "~/.emacs.d/my/")
(require 'init-basic)
(require 'init-ui)
(require 'init-plugin)
(require 'init-program)
(require 'init-hotkey)


;; 自定义部分移到单独文件中
(setq custom-file "~/.emacs.d/my/custom.el")
(load custom-file)
