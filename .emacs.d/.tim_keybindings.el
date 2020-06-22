(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)

(define-key python-mode-map (kbd "C-c b") 'python-insert-breakpoint)
(define-key python-mode-map (kbd "C-c f") 'python-show-function-definitions)
(define-key inferior-python-mode-map (kbd "C-c c") 'matplotlib-close-plots)
(define-key inferior-python-mode-map (kbd "C-c s") 'matplotlib-show-plots)
(define-key inferior-python-mode-map (kbd "C-c l") 'pyshell-pylab)

(defun my-python-mode-hook ()
  (local-set-key (kbd "C-c C-b") 'python-insert-breakpoint))
(add-hook 'py-mode-hook 'my-python-mode-hook)

(global-set-key "\C-c\C-i" 'my-insert-file-name)

(global-set-key "\M-%" 'query-replace-regexp)
