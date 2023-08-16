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
;; 使用<F8>注释/取消注释
(global-set-key (kbd "<f8>") 'comment-or-uncomment-region)


;; 使用Ctrl-x p s => project-find-regexp
(global-set-key (kbd "C-x p s") 'project-find-regexp)
;; 使用Ctrl-x p f => project-find-file
(global-set-key (kbd "C-x p f") 'project-find-file)



;;;;;;;;;;;;;;;;;;;;
(provide 'init-hotkey)
