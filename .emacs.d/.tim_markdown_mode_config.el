;;--------------------------------------------------
;; insert current date as YYYY-MM-DD within markdown level-3 header
(defun markdown-insert-date-header ()
  (interactive)
  (markdown-insert-header-atx-3)
  (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d)"))
  (end-of-line 2))

(defun markdown-insert-meeting-with-elliott ()
  (interactive)
  (markdown-insert-header-atx-3)
  (insert "e-meeting with Elliott"))

(defun my-markdown-mode-keys ()
  "my keys for `markdown-mode'."
  (interactive)
  (local-set-key (kbd "C-c d") 'markdown-insert-date-header)
  (local-set-key (kbd "C-c e") 'markdown-insert-meeting-with-elliott))
(add-hook 'markdown-mode-hook 'my-markdown-mode-keys)
