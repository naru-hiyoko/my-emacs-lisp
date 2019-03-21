;; Append following line to ~/.emacs.d/init.el
;; (load-file "~/.emacs.d/lisp/init.el")

(add-to-list 'load-path "~/.emacs.d/lisp/elixir-mode/")
(require 'elixir-mode)

(defun load_elixir_snippet ()
  (load-file "~/.emacs.d/lisp/elixir-mode-snippet.el"))

(add-hook 'elixir-mode-hook 'load_elixir_snippet)
	  
