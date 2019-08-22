;; Append following line to ~/.emacs.d/init.el
;; (load-file "~/.emacs.d/lisp/init.el")

(kill-buffer "*scratch*")

(add-to-list 'load-path "~/.emacs.d/lisp/elixir-mode/")
(add-to-list 'load-path "~/.emacs.d/lisp/plantuml-mode/")

(require 'whitespace)
(require 'elixir-mode)
(require 'plantuml-mode)

(defun set-elixir-mode-config ()
  (global-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq tab-width 2)
  (load-file "~/.emacs.d/lisp/elixir-mode/elixir-mode-skeleton.el"))

(defun set-markdown-mode-config ()
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (set (make-local-variable 'whitespace-action) nil))

(defun set-plantuml-mode-config ()
  (global-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq tab-width 2))

(defun set-sh-mode-config ()
  (global-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq tab-width 2))

(add-hook 'elixir-mode-hook 'set-elixir-mode-config)
(add-hook 'markdown-mode-hook 'set-markdown-mode-config)
(add-hook 'plantuml-mode-hook 'set-plantuml-mode-config)
(add-hook 'sh-mode-hook 'set-sh-mode-config)

(global-whitespace-mode t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq js-indent-level 2)
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

;; Custome functions
(defun kill-current-buffer ()
  (interactive "")
  (setq b (buffer-name (current-buffer)))
  (kill-buffer b))

(defun forward-5-lines ()
  (interactive "")
  (forward-line 5))

(defun backward-5-lines ()
  (interactive "")
  (forward-line -5))

;; Key Bindings
(define-key global-map [?¥] [?\\] )
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key (kbd "C-<SPC>") nil)
(global-set-key (kbd "M-<SPC>") 'set-mark-command)
(global-set-key (kbd "C-m") nil)
(global-set-key (kbd "C-o") 'other-window)

(global-set-key (kbd "C-/") 'hippie-expand)
(global-set-key (kbd "M-/") 'hippie-expand)

(global-set-key (kbd "M-<up>") 'next-buffer)
(global-set-key (kbd "M-<down>") 'previous-buffer)

(global-set-key (kbd "M-+") 'text-scale-increase)
(global-set-key (kbd "M-_") 'text-scale-decrease)

(global-set-key (kbd "M-r") 'query-replace)
(global-set-key (kbd "M-z") 'undo)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-n") 'forward-5-lines)
(global-set-key (kbd "M-p") 'backward-5-lines)
(global-set-key (kbd "C-x k") 'kill-current-buffer)
(global-set-key (kbd "S-M-<SPC>") 'rectangle-mark-mode)
(global-set-key (kbd "<RET>") 'newline)
(global-set-key (kbd "C-M-f") 'toggle-frame-maximized)

(which-function-mode 1)
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
(setq-default truncate-lines t)

;; (add-hook 'after-change-major-mode-hook (lambda() (electric-indent-mode -1)))

(fset 'yes-or-no-p 'y-or-n-p)
(show-paren-mode 1)
(setq column-number-mode t)
;(setq show-paren-style 'mixed)
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
(setq initial-frame-alist '( (top . 0) (left . 0) (width . 150) (height . 50)))
(set-face-foreground 'mode-line "black")
(set-face-background 'mode-line "white")

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

;;コンパイルウィンドウ設定
(require 'compile)

(defvar yel-compile-auto-close t
  "* If non-nil, a window is automatically closed after (\\[compile]).")

(defvar yel-compile-auto-close t
  "* If non-nil, a window is automatically closed after (\\[recompile]).")

(defadvice compile (after compile-aftercheck activate compile)
  "Adds a funcion of windows auto-close."
  (let ((proc (get-buffer-process "*compilation*")))
    (if (and proc yel-compile-auto-close)
        (set-process-sentinel proc 'yel-compile-teardown))))

(defadvice recompile (after compile-aftercheck activate compile)
  (let ((proc (get-buffer-process "*compilation*")))
    (if (and proc yel-compile-auto-close)
        (set-process-sentinel proc 'yel-compile-teardown))))

(defun yel-compile-teardown (proc status)
  "Closes window automatically, if compile succeed."
  (let ((ps (process-status proc)))
    (if (eq ps 'exit)
        (if (eq 0 (process-exit-status proc))
            (progn
              (delete-other-windows)
              (kill-buffer "*compilation*")
              (message "---- Compile Success ----")
              )
          (message "Compile Failer")))
    (if (eq ps 'signal)
        (message "Compile Abnormal end"))))

;; Additional Major Mode
