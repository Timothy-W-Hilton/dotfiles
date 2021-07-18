;;; from https://github.com/huseyinyilmaz/emacs-config/blob/652dcf00797e279c7f921631f4c33356e9bca224/lisp/user-init-packages.el
;;; user-init-packages.el --- Configure packages

;;; Commentary:
;;

(require 'package)
(defvar user-packages '(ein
			solarized-theme
			pdf-tools
			zenburn-theme
			websocket
			visual-fill-column
			shell-switcher
			python-mode
			pylint
			polymode
			pandoc-mode
			markdown-mode
			magit
			jedi-direx
			idomenu
			exec-path-from-shell
			ess
			emojify
			elpy
			boxquote
			auctex
			nginx-mode
			yaml-mode
			hide-lines
			ag))

;;; Code:

;; package resources
;; ("gnu" . "http://elpa.gnu.org/packages/")
;; ("marmalade" . "http://marmalade-repo.org/packages/")
;; ("melpa" . "http://melpa.milkbox.net/packages/")

(add-to-list 'package-archives
	     '("gnu" . "https://elpa.gnu.org/packages/"))

;; (add-to-list 'package-archives
;; 	     '("melpa" . "https://melpa.org/packages/"))

(add-to-list 'package-archives
	     '("melpa" . "http://www.mirrorservice.org/sites/melpa.org/packages/"))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; install packages that is stored in user-packages variable
(dolist (p user-packages)
  (when (not (package-installed-p p))
    (package-refresh-contents)
    (package-install p)))

(message "config packages")
(provide 'user-init-packages)
;;; user-init-packages.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (boxquote color-theme-solarized elpy emojify ess exec-path-from-shell idomenu  jedi-direx magit markdown-mode pandoc-mode pylint python-mode  shell-switcher visual-fill-column zenburn-theme pdf-tools solarized-theme ein))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
