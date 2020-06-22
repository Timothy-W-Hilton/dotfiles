;; emacs configurations for reading/writing mail

(autoload 'post-mode "post" "mode for e-mail" t)
(add-to-list 'auto-mode-alist
             '("\\.*mutt-*\\|.article\\|\\.followup"
                . post-mode))

(add-hook 'post-mode-hook
  (lambda()
    (auto-fill-mode t)
    (flyspell-mode t)
    ;; (setq fill-column 72)    ; rfc 1855 for usenet messages
    (require 'boxquote)
    (setq  confirm-kill-emacs 'nil)))  ;confirm on exit is annoying for emacs
