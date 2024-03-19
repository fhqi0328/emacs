;; Comment
;; 快捷键配置文件


;; 使用ibuffer替换原buffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; 使用Enter，换行并缩进
(global-set-key (kbd "RET") 'newline-and-indent)

;; M-g 跳转到指定行
(global-set-key (kbd "M-g") 'goto-line)

;; 使用C-2或C-@ 进行set mark
(global-set-key (kbd "C-2") 'set-mark-command)

;; 使用C-o切换窗口
(global-set-key (kbd "C-o") 'other-window)

;; 使用ctrl-<backspace> to kill word, not working when ssh
(global-set-key (kbd "C-<DEL>") 'backward-kill-word)

;; 使用<F1>清除空格
(global-set-key (kbd "<f1>") 'whitespace-cleanup)

;; 使用<F2> convert whitespace to tab
(global-set-key (kbd "<f2>") 'tabify)

;; 使用<F3> convert tab to whitespace
(global-set-key (kbd "<f3>") 'untabify)

;; 使用<F8>注释/取消注释
(global-set-key (kbd "<f8>") 'comment-or-uncomment-region)


;; C-c j代替C-c C-j (C-j和tmux冲突)
;; 使用counsel-imenu代替imenu
(global-set-key (kbd "C-c j") 'counsel-imenu)

;; project快捷键
(global-set-key (kbd "C-c f") 'project-find-file)
(global-set-key (kbd "C-c g") 'project-find-regexp)
(global-set-key (kbd "C-c c") 'project-compile)
(global-set-key (kbd "C-c e") 'project-eshell)
(global-set-key (kbd "C-c b") 'project-switch-to-buffer)


;;;;;;;;;;;;;;;;;;;;
(provide 'init-hotkey)
