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
  (interactive "s Module Name Of Subtype:")
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

