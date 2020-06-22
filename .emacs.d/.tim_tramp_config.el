;;--------------------------------------------------
;; USE TRAMP FOR EDITING REMOTE FILES

(setq tramp-auto-save-directory "~/emacs.d/tramp-autosave")
; tell tramp to ignore version control stuff in remote directories
(setq vc-ignore-dir-regexp
       (format "\\(%s\\)\\|\\(%s\\)"
	       vc-ignore-dir-regexp
	       tramp-file-name-regexp))
