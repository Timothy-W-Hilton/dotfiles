;;--------------------------------------------------
;; org mode
(add-hook 'inferior-org-mode-hook
          (lambda()
	    (local-set-key (kbd "M-q") 'org-fill-paragraph)))
