(defvar croma_atom_snippet
  '("" nil > "use" " " "Croma.SubtypeOfAtom, " "values: [" _ "]" \n))

(defvar croma_float_snippet
  '("" nil > "use" " " "Croma.SubtypeOfFloat, " "min: " _ ", max: " \n))

(defvar croma_string_snippet
  '("" nil > "use" " " "Croma.SubtypeOfString, pattern: " _ \n))

(defvar croma_int_snippet
  '("" nil > "use" " " "Croma.SubtypeOfInt, min: " _ " max: " \n))

(defvar croma_list_snippet
  '("" nil > "use" " " "Croma.SubtypeOfList, elem_module: " _ ", min_length: , max_length: " \n))

(defvar croma_map_snippet
  '("" nil > "use" " " "Croma.SubtypeOfMap, key_module: " _ ", value_module: , min_size: , max_size: " \n))

(defvar croma_tuple_snippet
  '("" nil > "use" " " "Croma.SubtypeOfTuple, elem_modules: [" _ "]" \n))


(defun croma-skeleton-insert (module)
  "Insert snippet of specified sub module of croma struct."
  (interactive "s Module Name (atom, string, int...):")
  (setq snippet (pcase module
                  ("atom" croma_atom_snippet)
                  ("float" croma_float_snippet)
                  ("string" croma_string_snippet)
                  ("int" croma_int_snippet)
                  ("list" croma_list_snippet)
                  ("map" croma_map_snippet)
                  ("tuple" croma_tuple_snippet)
                  (otherwise "")))
  (pcase snippet
    ("" (message "select one of (atom | float | string | int | list | map | tuple)"))
    (otherwise (skeleton-insert snippet))))

(defun import_mix_project_funtions ()
  "Extract loaded functions in mix project to buffer."
  (interactive)
  (setq mix_root (read-file-name "Mix Root: "))
  (setq c_buf (current-buffer))
  (get-buffer-create "mix-project-functions")
  (set-buffer "mix-project-functions")
  (erase-buffer)
  (cd mix_root)
  (message "load module functions in projects...")
  (setq result (shell-command-to-string "mix run ~/.emacs.d/lisp/elixir-mode/extract_project_functions.ex"))
  (insert result)
  (message "load module functions ... done."))
