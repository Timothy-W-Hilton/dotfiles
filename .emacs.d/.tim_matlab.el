;;--------------------------------------------------
;; USE MATLAB MODE FOR MATLAB CODE

;(load-library "matlab-load")
(require 'matlab-load)
(setq matlab-shell-command-switches '("-nosplash -nodesktop"))
;(matlab-cedet-setup)

;; ; Setup matlab mode
(defun matlab-insert-continuation ()
  "insert ...\n at point (matlab line continuation symbol)"
  (interactive)
  (insert "...\n")
)

(defun matlab-delete-indentation ()
  "Join this line to previous and fix up whitespace at
join,removing '...' from previous line If there is a fill
prefix,delete it from the beginning of this line.  With argument,
join this line to following line."
  (interactive)
  (delete-indentation)
  (save-excursion
    (let ( p1 p2 )
      (setq p1 (point))
      (skip-chars-backward "\\. ") (setq p2 (point))
      (delete-region p1 p2))))

(defun my-matlab-mode-hook ()
  (setq fill-column 80)
  ;(auto-complete-mode 1)
  (setq matlab-fill-fudge 0 )
  (setq matlab-fill-fudge-hard-maximum 82 )
  (setq matlab-indent-function-body nil)
  (local-set-key (kbd "M-;") 'comment-dwim)
  (local-set-key (kbd "<C-return>") 'matlab-insert-continuation)
  (local-set-key (kbd "M-^") 'matlab-delete-indentation))

(defun my-matlab-shell-mode-hook ()
  (local-set-key (kbd "C-<return>") 'matlab-insert-continuation)
  (local-set-key (kbd "M-^") 'matlab-delete-indentation))

(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
(add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)
