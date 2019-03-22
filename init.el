;; Append following line to ~/.emacs.d/init.el
;; (load-file "~/.emacs.d/lisp/init.el")

(add-to-list 'load-path "~/.emacs.d/lisp/elixir-mode/")
(add-to-list 'load-path "~/.emacs.d/lisp/plantuml-mode/")

(require 'whitespace)
(require 'elixir-mode)
(require 'plantuml-mode)

(defun set-elixir-mode-config ()
  (load-file "~/.emacs.d/lisp/elixir-mode-snippet.el"))

(defun set-markdown-mode-config ()
  (setq indent-tabs-mode t)
  (set (make-local-variable 'whitespace-action) nil))

(defun set-plantuml-mode-config ()
  (setq tab-width 2))

(add-hook 'elixir-mode-hook 'set-elixir-mode-config)
(add-hook 'markdown-mode-hook 'set-markdown-mode-config)
(add-hook 'plantuml-mode-hook 'set-plantuml-mode-config)

(global-whitespace-mode t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq whitespace-style '(face trailing tabs spaces empty space-mark tab-mark))
(setq whitespace-space-regexp "\\(\u3000+\\)")
(setq whitespace-action '(auto-cleanup))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

(set-face-attribute 'whitespace-trailing nil
                    :background "Black"
                    :foreground "DeepPink"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background "Black"
                    :foreground "LightSkyBlue"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :background "Black"
                    :foreground "GreenYellow"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                    :background "Black")

(set-face-attribute 'region nil :background "#666")

;; Key Bindings
(define-key global-map [?¥] [?\\] )
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key (kbd "C-m") nil)
(global-set-key (kbd "M-r") 'replace-string)
(global-set-key (kbd "M-z") 'undo)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-c" 'compile)
(global-set-key "\C-o" nil)
(global-set-key (kbd "C-<SPC>") nil)
(global-set-key (kbd "M-<SPC>") 'set-mark-command)
(global-set-key (kbd "S-M-<SPC>") 'rectangle-mark-mode)
(global-set-key (kbd "<RET>") 'newline)
(global-font-lock-mode t)

(setq kill-whole-line t)
(setq require-final-newline t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
(setq global-hl-line t)

;; (add-hook 'after-change-major-mode-hook (lambda() (electric-indent-mode -1)))

(fset 'yes-or-no-p 'y-or-n-p)
(show-paren-mode 1)
(setq show-paren-style 'mixed)
(global-linum-mode 1)
(setq linum-format "%4d:")
(setq which-function-mode 1)
(blink-cursor-mode 0)
(setq tool-bar-mode 0)
(setq tool-bar-style 'text)
(menu-bar-mode 0)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")

;; Face Settings
(set-face-attribute 'default nil :family "Menlo" :height 160)
(setq initial-frame-alist '( (top . 0) (left . 0) (width . 100) (height . 50)))

;; Scroll Settings
(defun scroll-down-with-lines ()
  "" (interactive) (scroll-down 3))

(defun scroll-up-with-lines ()
  "" (interactive) (scroll-up 3))

(global-set-key [wheel-up] 'scroll-down-with-lines)
(global-set-key [wheel-down] 'scroll-up-with-lines)
(global-set-key [double-wheel-up] 'scroll-down-with-lines)
(global-set-key [double-wheel-down] 'scroll-up-with-lines)
(global-set-key [triple-wheel-up] 'scroll-down-with-lines)
(global-set-key [triple-wheel-down] 'scroll-up-with-lines)


;; Additional Major Mode
