;;--------------------------------------------------
;; use ESS (Emacs Speaks Statistics) for R code, processes

(require 'ess-site)   ; this doesn't seem to work if ess not installed from elpa -- TWH 5 Nov 2013

(add-hook 'inferior-ess-mode-hook
          (lambda()
	    (setq comint-input-ring-size 1500 )))
	    ;(local-set-key (kbd "_") 'ess-smart-underscore)
	    ;(local-set-key (kbd "(") 'ess-r-args-auto-show)))

(defun R-insert-breakpoint ()
  "insert 'browser()' at point"
  (interactive)
  (move-end-of-line nil)  ; move-end-of-line requires an argument
  (newline-and-indent)
  (insert "browser()")
)
(define-key ess-mode-map (kbd "C-c b") 'R-insert-breakpoint)
(defun R-close-plots ()
  "insert 'graphics.off()' at point"
  (interactive)
  (insert "graphics.off()"))
(define-key inferior-ess-mode-map (kbd "C-c c") 'R-close-plots)


(setq ess-history-directory "~/.R/")
(setq ess-history-file t)
(setq inferior-R-args "--no-save --no-restore")
