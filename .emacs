(setq show-paren-style 'expression)
(show-paren-mode 2)

;; (menu-bar-mode -1)
(tool-bar-mode -1)

(setq make-backup-files				 nil) ; Don't want any backup files
(setq auto-save-list-file-name	 nil) ; Don't want any .saves files
(setq auto-save-default				 nil) ; Don't want any auto saving

(add-to-list 'load-path "~/.emacs.d/lisp")

;; http://code.google.com/p/dea/source/browse/trunk/my-lisps/linum%2B.el
(require 'linum+)
(setq linum-format "%d ")
(global-linum-mode 1)

;; built-in
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; built-in
(require 'bs)
(setq bs-configurations
			'(("files" "^\\*scratch\\*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))

(global-set-key (kbd "<f2>") 'bs-show)

(require 'popup)
;; http://www.emacswiki.org/emacs/AutoComplete
(add-to-list 'load-path "~/.emacs.d/lisp/auto-complete")
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/auto-complete/dict")

;; http://www.emacswiki.org/emacs/SrSpeedbar
(require 'sr-speedbar)
(setq speedbar-directory-unshown-regexp "^\\(CVS\\|RCS\\|SCCS\\|\\.\\.*$\\)\\'")
(global-set-key (kbd "<M-f12>") 'sr-speedbar-toggle)


;; http://www.emacswiki.org/emacs/Yasnippet
(add-to-list 'load-path "~/.emacs.d/lisp/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
(yas/load-directory "~/.emacs.d/lisp/yasnippet/snippets")


;; rsence

(require 'rsense)
(require 'find-file-in-project)

;; http://www.emacswiki.org/emacs/ColorTheme
;; Tools -> Color themes
;; (add-to-list 'load-path "~/.emacs.d/lisp/color-theme")
;; (require 'color-theme)
;; (color-theme-initialize)
;; (setq color-theme-is-global t)

;; (color-theme-robin-hood)
;; (color-theme-classic)
;; (color-theme-select)

;; Options -> Set default font
;; (add-to-list 'default-frame-alist '(font . "Consolas-18"))
;; (set-default-font "Consolas-18)


;; double string
(defun duplicate-line()
	(interactive)
	(move-beginning-of-line 1)
	(kill-line)
	(yank)
	(open-line 1)
	(next-line 1)
	(yank)
)
(global-set-key (kbd "C-d") 'duplicate-line)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-tabs-mode t)
 '(speedbar-show-unknown-files t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Inhibit startup/splash screen
(setq inhibit-splash-screen		t)
(setq ingibit-startup-message t) ;; экран приветствия можно вызвать комбинацией C-h C-a

;; Delete selection
(delete-selection-mode t)

(blink-cursor-mode -1) ;; курсор не мигает
;; Start window size
(when (window-system)
		(set-frame-size (selected-frame) 200 100))

(add-to-list 'load-path "~/.emacs.d/lisp/smartparens")
(require 'smartparens)
(require 'smartparens-config)
(require 'smartparens-ruby)

;; copy paste to system
;; (setq interprogram-cut-function 'own-clipboard)
;; (setq interprogram-paste-function 'get-clipboard)

;; Indent settings
(setq-default indent-tabs-mode  t) ;; отключить возможность ставить отступы TAB'ом
(setq-default tab-width	 2) ;; ширина табуляции - 4 пробельных символа
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
(setq-default c-basic-offset  2)
(setq-default standart-indent  2) ;; стандартная ширина отступа - 4 пробельных символа
;; (setq-default lisp-body-indent		2) ;; сдвигать Lisp-выражения на 4 пробельных символа
;; (global-set-key (kbd "RET") 'newline-and-indent) ;; при нажатии Enter перевести каретку и сделать отступ
;; (setq lisp-indent-function	 'common-lisp-indent-function)
;;(smart-tabs-advice ruby-indent-line ruby-indent-level)
;;(setq ruby-indent-tabs-mode t)

;; Scrolling settings
(setq scroll-step               1) ;; вверх-вниз по 1 строке
(setq scroll-margin            10) ;; сдвигать буфер верх/вниз когда курсор в 10 шагах от верхней/нижней границы  
(setq scroll-conservatively 10000)

;; fill column indicator
(require 'fill-column-indicator) 
(add-hook 'emacs-lisp-mode-hook (lambda ()
    (fci-mode 1)
  ))

;; elpa
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
												 ("org" . "http://orgmode.org/elpa/")
												 ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

;; hot keys

(define-key global-map [?\s-l] 'forward-char)
(define-key global-map [?\s-j] 'backward-char)
(define-key global-map [?\s-i] 'previous-line)
(define-key global-map [?\s-k] 'next-line)
(define-key global-map [?\s-n] 'scroll-up-command)
(define-key global-map [?\s-m] 'scroll-down-command)
(define-key global-map [?\s-g] 'goto-line)
(define-key global-map [?\s-u] 'move-beginning-of-line)
(define-key global-map [?\s-o] 'move-end-of-line)

;; ergoemacs-mode
;;(package-initialize)
;;(require 'ergoemacs-mode)
;;(setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
;;(setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
;;(ergoemacs-mode 1)


;; Setting movement
;; (defvar cfg-mode-map (make-sparse-keymap))

;; (define-minor-mode cfg-mode
;;   "cfg-mode"
;;   :lighter " cfg"
;;   cfg-mode-map)

;; (defadvice load (after cfg-keybindings-priority)
;;   (if (not (eq (car (car minor-mode-map-alist)) 'cfg-mode))
;;       (let ((mykeys (assq 'cfg-mode minor-mode-map-alist)))
;;         (assq-delete-all 'cfg-mode minor-mode-map-alist)
;;         (add-to-list 'minor-mode-map-alist mykeys))))
;; (ad-activate 'load)

;; (defun turn-pon-cfg-mode ()
;;   (interactive)
;;   (cfg-mode t))

;; (defun turn-off-cfg-mode ()
;;   (interactive)
;;   (cfg-mode -1))

;; (define-globalized-minor-mode global-cfg-mode cfg-mode turn-on-cfg-mode)

;; (defun lcl:get-hotkeys ()
;; 	(line
;; 	 (list "<C-S-k>" 'deleteline)
;;   (list "<C-l>" 'forward-char)
;; 	 (list "<C-j>" 'backward-char)
;; 	 (list "<C-i>" 'previous-line)
;; 	 (list "<C-k>" 'next-line)
;; 	 (list "<M-l>" 'next-word)
;; 	 (list "<M-j>" 'previous-word)
;; 	 (list "<M-i>" 'previous-page)
;; 	 (list "<M-k>" 'scroll-up)

;;    (list "C-x u" 'undo-tree-visualize)
 
;;    (list "M-Z" 'undo-tree-redo)
;;    (list "M-z" 'undo-tree-undo)))

;; (defun cfg:cfg-hotheys (map)
;;   (dolist (k (lcl:get-hotkeys))
;;     (when k
;;       (let ((key (kbd (car k)))
;;             (func (car (cdr k))))
;;         (define-key map key func)
;;         (list key func)))))

;; (defun cfg:cfg ()
;;   (add-hook 'minibuffer-setup-hook 'turn-off-cfg-mode)
;;   (cfg:cfg-hotheys cfg-mode-map)
;;   (global-cfg-mode))

;; resizw window

(add-to-list 'load-path "~/.emacs.d/lisp/multiple-cursors.el")
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; go
(add-to-list 'load-path "~/.emacs.d/lisp/go-mode.el")
(require 'go-mode-autoloads)
(add-hook 'before-save-hook 'gofmt-before-save)

;; godoc
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

;; go path
(setenv "GOPATH" "/home/strike/work/go_work")

;; gofmt on save
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path "/home/strike/work/go_work")
(add-hook 'before-save-hook 'gofmt-before-save)

;; godef-jump
(defun my-go-mode-hook ()
  ; Call Gofmt before saving                                                    
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Godef jump key binding                                                      
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)

;; autocomplete go

(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

;; compile go

(defun my-go-mode-hook ()
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go generate && go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)

