;; strategy for installing packages adapted from
;; https://github.com/huseyinyilmaz/emacs-config/blob/652dcf00797e279c7f921631f4c33356e9bca224/lisp/user-init-packages.el#L28-L31
;;
;; strategy for separating .emacs into calls to smaller files adapted
;; from http://ergoemacs.org/emacs/organize_your_dot_emacs.html

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; make sure packages are installed
(load "~/.emacs.d/.user-init-packages.el")

;; basic configuration (obviously :) )
(load "~/.emacs.d/.tim_emacs_basic_config.el")

;; elisp function definitions
(load "~/.emacs.d/.tim_elisp_functions.el")

;; --------------------------------------------------
;; configurations for specific modes
(load "~/.emacs.d/.tim_ibuffer_config.el")
;;(load "~/.emacs.d/.tim_matlab.el")
(load "~/.emacs.d/.tim_ispell.el")
(load "~/.emacs.d/.tim_mac_specific.el")
(load "~/.emacs.d/.tim_ido.el")
(load "~/.emacs.d/.tim_mail.el")
;;(load "~/.emacs.d/.tim_jabber.el")
(load "~/.emacs.d/.tim_magit.el")
(load "~/.emacs.d/.tim_R_ess_config.el")
(load "~/.emacs.d/.tim_tramp_config.el")
(load "~/.emacs.d/.tim_LaTeX_config.el")
(load "~/.emacs.d/.tim_python_config.el")
(load "~/.emacs.d/.tim_org_mode_config.el")
;;(load "~/.emacs.d/.tim_fortran_mode_config.el")
(load "~/.emacs.d/.tim_markdown_mode_config.el")
;; --------------------------------------------------
;; key bindings
(load "~/.emacs.d/.tim_keybindings.el")

;; The below are thigns that Custom has added to my .emacs over the years.  For now I'm leaving it here because I have a feeling Custom would restore most of it over time if I tried to move it.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(custom-safe-themes
   (quote
    ("67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "cbef37d6304f12fb789f5d80c2b75ea01465e41073c30341dc84c6c0d1eb611d" "9f443833deb3412a34d2d2c912247349d4bd1b09e0f5eaba11a3ea7872892000" default)))
 '(elpy-rpc-backend "rope")
 '(ess-roxy-template-alist
   (quote
    (("description" . ".. content for \\description{} (no empty lines) ..")
     ("details" . ".. content for \\details{} ..")
     ("title" . "")
     ("param" . "")
     ("return" . "")
     ("author" . "Timothy W. Hilton")
     ("export" . ""))))
 '(fci-rule-color "#383838")
 '(frame-background-mode nil)
 '(inferior-R-args "--no-save --no-restore")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-replace-disputed-keys t)
 '(package-selected-packages
   (quote
    (ein solarized-theme pdf-tools zenburn-theme websocket visual-fill-column shell-switcher python-pylint python-mode pylint polymode pandoc-mode markdown-mode magit jedi-direx ipython idomenu f90-interface-browser exec-path-from-shell ess emojify elpy color-theme-solarized boxquote auctex)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(post-rename-buffer nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
