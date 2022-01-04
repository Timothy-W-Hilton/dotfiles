;;--------------------------------------------------
;; org mode
(global-set-key "\C-ca" 'org-agenda)
(setq-local org-deadline-warning-days 60)

(add-hook 'inferior-org-mode-hook
          (lambda()
	    (local-set-key (kbd "M-q") 'org-fill-paragraph)))
