;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Timothy W. Hilton"
      user-mail-address "t.hilton@gns.cri.nz")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "DejaVu Sans Mono" :size 16 :weight 'light))
    ;; doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;; (setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light))
;;     doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)  ; default
(setq doom-theme 'doom-zenburn)  ; the python interpreter error face is awful :(
;;(setq doom-theme 'doom-nord-aurora)                                 ;
                             ;
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; ;; https://emacs-lsp.github.io/lsp-mode/page/faq/#how-do-i-force-lsp-mode-to-forget-the-workspace-folders-for-multi-root
;; (advice-add 'lsp :before (lambda (&rest _args) (eval '(setf (lsp-session-server-id->folders (lsp-session)) (ht)))))

(after! python
  (setq python-shell-interpreter "jupyter"
        python-shell-interpreter-args "console --simple-prompt"
        python-shell-completion-native-disabled-interpreters '("jupyter")
        lsp-file-watch-threshold 9999)
  (custom-theme-set-faces! '(doom-zenburn, doom-nord-aurora)
   `(ansi-color-yellow :background, "#F18C96")))

(add-hook! 'python-mode-hook #'hs-minor-mode)
(add-hook! inferior-python-mode :append (yas-activate-extra-mode 'python-mode))
(add-hook! inferior-ess-r-mode :append (yas-activate-extra-mode 'ess-mode))  ;; iESS mode goes with inferior R processes - i.e. an R interpreter buffer.  defined in ess-r-mode.el
;; (add-hook 'snippet-mode-hook 'my-snippet-mode-hook)
;; (defun my-snippet-mode-hook ()
;;   "Custom behaviours for `snippet-mode'."
;;   ; adapted from https://www.reddit.com/r/emacs/comments/ap78wi/comment/eg6a4lj/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
;;   (setq-local require-final-newline nil))

;; setup key bindings for python LSP (language server protocol)
;; from https://github.com/emacs-lsp/lsp-mode/issues/1532#issuecomment-602384182
(use-package lsp-mode
  :ensure t
  :defer t
  :after python
  :hook (lsp-mode . (lambda ()
                      (let ((lsp-keymap-prefix "s-l"))
                        (lsp-enable-which-key-integration))))
  :init
  (setq lsp-keep-workspace-alive nil
        lsp-signature-doc-lines 5
        lsp-idle-delay 0.5
        lsp-prefer-capf t
        lsp-client-packages nil
        lsp-ui-doc-max-height 50
        lsp-ui-doc-max-width 150
        lsp-ui-doc-position 'top)
  :config
  ;; (setq lsp-ui-doc-show-with-cursor t)  ## from https://www.reddit.com/r/DoomEmacs/comments/wqpbdf/how_to_get_the_lspuidocshow_popup_to_show_while/
  ;; (setq lsp-ui-doc-delay 0.2)  ## from https://www.reddit.com/r/DoomEmacs/comments/wqpbdf/how_to_get_the_lspuidocshow_popup_to_show_while/
  (define-key lsp-mode-map (kbd "s-l") lsp-command-map)
  (define-key lsp-mode-map (kbd "s-l h s") #'lsp-ui-doc-show)
  (define-key lsp-mode-map (kbd "s-l h f") #'lsp-ui-doc-focus-frame))


;; formatting with black
(use-package! python-black
  :demand t
  :after python
  :config
  (add-hook! 'python-mode-hook #'python-black-on-save-mode)
  ;; Feel free to throw your own personal keybindings here
  (map! :leader :desc "Blacken Buffer" "m b b" #'python-black-buffer)
  (map! :leader :desc "Blacken Region" "m b r" #'python-black-region)
  (map! :leader :desc "Blacken Statement" "m b s" #'python-black-statement)
  (setq python-black-extra-args '("--preview"))  ; --preview includes wrapping long strings 2022-03-24
                                               ; must be a list of strings https://github.com/wbolster/emacs-python-black/issues/7
  )

;; see https://github.com/hlissner/doom-emacs/issues/4178
(setq mac-command-modifier      'super
      ns-command-modifier       'super
      mac-option-modifier       'meta
      ns-option-modifier        'meta
      mac-right-option-modifier 'meta
      ns-right-option-modifier  'meta)

;;
(setq org-agenda-files '("~/Documents/ResearchJournal"))

;; use "smart assign" in ESS mode
;; https://discourse.doomemacs.org/t/how-to-re-bind-keys/56
(map! :after ess
      :map ess-mode-map
      "_" #'ess-insert-assign)
(map! :after ess
      :map inferior-ess-mode-map
      "_" #'ess-insert-assign)

;; ;; use styler
;; (def-package! reformatter
;;   :config
;;   (defconst Rscript-command "Rscript")
;;   (reformatter-define styler
;;     :program Rscript-command
;;     :args (list "--vanilla" "-e" "con <- file(\"stdin\")
;; out <- styler::style_text(readLines(con))
;; close(con)
;; out")
;;     :lighter " styler"))

