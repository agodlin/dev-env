(load "~/.emacs.d/lisp/python/jedi-starter")
(load "~/.emacs.d/lisp/web/web-mode")

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;my setup

(define-key global-map "\eq" 'other-window)

; Startup windowing
; (setq next-line-add-newlines nil)
(setq-default truncate-lines t)
(setq truncate-partial-width-windows nil)
(split-window-horizontally)
(setq next-line-add-newlines t)
(define-key global-map "\C-u" 'undo)

(global-set-key (read-kbd-macro "C-x f") 'find-file) 
(global-set-key (read-kbd-macro "C-x F") 'find-file-other-window)

(global-set-key (read-kbd-macro "\C-x b")  'ido-switch-buffer)
(global-set-key (read-kbd-macro "\C-x B")  'ido-switch-buffer-other-window)
