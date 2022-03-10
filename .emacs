;; strategy for installing packages adapted from
;; https://github.com/huseyinyilmaz/emacs-config/blob/652dcf00797e279c7f921631f4c33356e9bca224/lisp/user-init-packages.el#L28-L31
;;
;; strategy for separating .emacs into calls to smaller files adapted
;; from http://ergoemacs.org/emacs/organize_your_dot_emacs.html

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(add-to-list 'term-file-aliases
	     '("screen.xterm-256color" . "xterm-256color"))

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
;; (load "~/.emacs.d/.tim_mail.el")
;; ;;(load "~/.emacs.d/.tim_jabber.el")
(load "~/.emacs.d/.tim_magit.el")
(load "~/.emacs.d/.tim_R_ess_config.el")
(load "~/.emacs.d/.tim_tramp_config.el")
(load "~/.emacs.d/.tim_LaTeX_config.el")
(load "~/.emacs.d/.tim_python_config.el")
(load "~/.emacs.d/.tim_org_mode_config.el")
 ;;(load "~/.emacs.d/.tim_fortran_mode_config.el")
(load "~/.emacs.d/.tim_markdown_mode_config.el")
;; ;; --------------------------------------------------
;; ;; key bindings
(load "~/.emacs.d/.tim_keybindings.el")

;; The below are thigns that Custom has added to my .emacs over the years.  For now I'm leaving it here because I have a feeling Custom would restore most of it over time if I tried to move it.

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(ansi-color-names-vector
;;    ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
;;  '(company-quickhelp-color-background "#4F4F4F")
;;  '(company-quickhelp-color-foreground "#DCDCCC")
;;  '(compilation-message-face 'default)
;;  '(cua-global-mark-cursor-color "#689d6a")
;;  '(cua-normal-cursor-color "#7c6f64")
;;  '(cua-overwrite-cursor-color "#b57614")
;;  '(cua-read-only-cursor-color "#98971a")
;;  '(custom-safe-themes
;;    '("285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "cbef37d6304f12fb789f5d80c2b75ea01465e41073c30341dc84c6c0d1eb611d" "9f443833deb3412a34d2d2c912247349d4bd1b09e0f5eaba11a3ea7872892000" default))
;;  '(elpy-rpc-backend "rope")
;;  '(elpy-rpc-virtualenv-path 'current)
;;  '(ess-roxy-template-alist
;;    '(("description" . ".. content for \\description{} (no empty lines) ..")
;;      ("details" . ".. content for \\details{} ..")
;;      ("title" . "")
;;      ("param" . "")
;;      ("return" . "")
;;      ("author" . "Timothy W. Hilton")
;;      ("export" . "")))
;;  '(fci-rule-color "#383838")
;;  '(frame-background-mode nil)
;;  '(highlight-changes-colors '("#d3869b" "#8f3f71"))
;;  '(highlight-symbol-colors
;;    '("#ef18e074a648" "#d880ec0bb8aa" "#f566c8569e35" "#e14fd5b2b825" "#e2f9e06fa59f" "#f10fd639a30d" "#c9d0d51cc3e8"))
;;  '(highlight-symbol-foreground-color "#665c54")
;;  '(highlight-tail-colors
;;    '(("#ebdbb2" . 0)
;;      ("#c6c148" . 20)
;;      ("#82cc73" . 30)
;;      ("#5b919b" . 50)
;;      ("#e29a3f" . 60)
;;      ("#df6835" . 70)
;;      ("#f598a7" . 85)
;;      ("#ebdbb2" . 100)))
;;  '(hl-bg-colors
;;    '("#e29a3f" "#df6835" "#cf5130" "#f598a7" "#c2608f" "#5b919b" "#82cc73" "#c6c148"))
;;  '(hl-fg-colors
;;    '("#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7"))
;;  '(hl-paren-colors '("#689d6a" "#b57614" "#076678" "#8f3f71" "#98971a"))
;;  '(ido-case-fold t)
;;  '(inferior-R-args "--no-save --no-restore")
;;  '(lsp-ui-doc-border "#665c54")
;;  '(nrepl-message-colors
;;    '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
;;  '(org-agenda-files '("~/Documents/ResearchJournal/2021_ResearchJournal.org"))
;;  '(package-selected-packages
;;    '(json-mode transpose-frame pdf-tools ag mutt-mode yaml-mode hide-lines nginx-mode gnu-elpa-keyring-update solarized-theme zenburn-theme websocket visual-fill-column shell-switcher python-mode pylint polymode pandoc-mode markdown-mode magit jedi-direx ipython idomenu f90-interface-browser exec-path-from-shell ess emojify elpy color-theme-solarized boxquote auctex))
;;  '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
;;  '(pos-tip-background-color "#ebdbb2")
;;  '(pos-tip-foreground-color "#665c54")
;;  '(post-rename-buffer nil)
;;  '(smartrep-mode-line-active-bg (solarized-color-blend "#98971a" "#ebdbb2" 0.2))
;;  '(term-default-bg-color "#fbf1c7")
;;  '(term-default-fg-color "#7c6f64")
;;  '(vc-annotate-background "#2B2B2B")
;;  '(vc-annotate-background-mode nil)
;;  '(vc-annotate-color-map
;;    '((20 . "#BC8383")
;;      (40 . "#CC9393")
;;      (60 . "#DFAF8F")
;;      (80 . "#D0BF8F")
;;      (100 . "#E0CF9F")
;;      (120 . "#F0DFAF")
;;      (140 . "#5F7F5F")
;;      (160 . "#7F9F7F")
;;      (180 . "#8FB28F")
;;      (200 . "#9FC59F")
;;      (220 . "#AFD8AF")
;;      (240 . "#BFEBBF")
;;      (260 . "#93E0E3")
;;      (280 . "#6CA0A3")
;;      (300 . "#7CB8BB")
;;      (320 . "#8CD0D3")
;;      (340 . "#94BFF3")
;;      (360 . "#DC8CC3")))
;;  '(vc-annotate-very-old-color "#DC8CC3")
;;  '(weechat-color-list
;;    '(unspecified "#fbf1c7" "#ebdbb2" "#750000" "#9d0006" "#747400" "#98971a" "#8a5100" "#b57614" "#004858" "#076678" "#9f4d64" "#d3869b" "#2e7d33" "#689d6a" "#7c6f64" "#3c3836"))
;;  '(xterm-color-names
;;    ["#ebdbb2" "#9d0006" "#98971a" "#b57614" "#076678" "#d3869b" "#689d6a" "#32302f"])
;;  '(xterm-color-names-bright
;;    ["#fbf1c7" "#af3a03" "#a89984" "#3c3836" "#7c6f64" "#8f3f71" "#665c54" "#282828"]))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;; '(default ((t (:inherit nil :extend nil :stipple nil :background "#3F3F3F" :foreground "#DCDCCC" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "DAMA" :family "DejaVu Sans Mono")))))
;; (put 'narrow-to-region 'disabled nil)
;; (put 'upcase-region 'disabled nil)

;; (set-frame-font "Liberation Mono-14:antialias=1" nil t)
;; (set-frame-font "Inconsolata-14:antialias=1" nil t)
;; (set-frame-font "mono:antialias=1" nil t)
(put 'dired-find-alternate-file 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "3b8284e207ff93dfc5e5ada8b7b00a3305351a3fb222782d8033a400a48eca48" default))
 '(elpy-rpc-virtualenv-path 'current)
 '(org-agenda-files
   '("~/Documents/ResearchJournal/2022_ResearchJournal.org" "~/Documents/ResearchJournal/2021_ResearchJournal.org"))
 '(package-selected-packages
   '(zenburn-theme yaml-mode websocket visual-fill-column transpose-frame solarized-theme shell-switcher python-mode pylint polymode pdf-tools pandoc-mode nginx-mode markdown-mode magit json-mode idomenu hide-lines exec-path-from-shell ess emojify elpy boxquote auctex ag)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
