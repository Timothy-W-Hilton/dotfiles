(server-start) ;;; For use with emacsclient

;;==============================================================
;;==============================================================
;; colors -- very important :)
;;==============================================================
;;==============================================================
(load-theme 'zenburn 1)

;;==============================================================
;;==============================================================
;; don't open GUI windows!

(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent yes-or-no-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))
(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent y-or-n-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))
 (defadvice message-box
   (around prevent-dialog activate)
   "Prevent message-box from activating a dialog"
   (apply #'message (ad-get-args 0)))

;;==============================================================
;;==============================================================
;; default window width and height
;;==============================================================
;;==============================================================

(defun custom-set-frame-size ()
  (add-to-list 'default-frame-alist '(height . 50))
  (add-to-list 'default-frame-alist '(width . 177)))
(custom-set-frame-size)
(add-hook 'before-make-frame-hook 'custom-set-frame-size)

;;==============================================================
;;==============================================================
;; auto-complete
;;==============================================================
;;==============================================================

;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete/dict")
;; (ac-config-default)

;;(require 'shell-switcher)  ;TODO do I still want this?

;;==============================================================
;;==============================================================
;; other miscellanious settings
;;==============================================================
;;==============================================================

; ls switches for dired mode
(setq dired-listing-switches "-alh")

; no splash screen
(setq inhibit-splash-screen 1)

;turn off menu bar and tool bar
(menu-bar-mode -1)
(tool-bar-mode -1)

(column-number-mode 1)

(set-face-attribute 'default nil
		    :family "Monaco" :height 130 :weight 'normal)
(global-font-lock-mode 1)
(transient-mark-mode 1)
(show-paren-mode 1) (require 'paren)
(ansi-color-for-comint-mode-on)
(mouse-wheel-mode 1)
(blink-cursor-mode -1)
;turn off scrollbars
(scroll-bar-mode -1)

(setq-default show-trailing-whitespace -1
              indicate-empty-lines 1)

;;--------------------------------------------------
;;don't let OS X trap command functions in emacs
(setq mac-pass-command-to-system 'nil)
(setq mac-pass-control-to-system 'nil)

;;--------------------------------------------------
;; use windmove to navigate windows
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))

;;--------------------------------------------------
;; enable visual paren-matching
(show-paren-mode 1)

;; specify particular modes for particular files/file types
(add-to-list 'auto-mode-alist '("\\.muttrc.*" . conf-mode))
(add-to-list 'auto-mode-alist '("\\..*rc" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.pbs\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("^[Mm]akefile\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . diff-mode))

; delete trailing whitespace before saving
(add-hook 'before-save-hook
          'delete-trailing-whitespace)
