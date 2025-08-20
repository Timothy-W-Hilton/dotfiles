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
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
(setq doom-font (font-spec :family "DejaVu Sans Mono" :size 16 :weight 'light))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-zenburn)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-agenda-files '("~/Documents/ResearchJournal"))


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

;; emacs itself ------------------------------

;; sidestep the new-frames-are-tiny bug in Emacs 29.1
;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=67654
;; another workaround is to use the "no toolkits" emacs
;; I think "no toolkits" means terminal-only
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; AI stuff ------------------------------

;; from https://github.com/copilot-emacs/copilot.el?tab=readme-ov-file#example-for-doom-emacs
;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("<tab>" . 'copilot-accept-completion)
              ("TAB" . 'copilot-accept-completion)
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))
(add-to-list
 'copilot-indentation-alist
 '(org-mode 4))
(add-to-list
 'copilot-indentation-alist
 '(snippet-mode 4))

;; get rid of unformatted HTML output from pyright
(setq eglot-prefer-plaintext t)
;; use the claude-code-ide package; when displaying ediff buffers place the
;; Claude Code IDE at the bottom of the window with ediff buffers side by side
;; above it.
(setq claude-code-ide-window-side 'bottom)

;; python stuff ------------------------------
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

(after! python
  (custom-theme-set-faces! '(doom-zenburn, doom-nord-aurora)
   `(ansi-color-yellow :background, "#F18C96")))

(add-hook! 'python-mode-hook #'hs-minor-mode)
(add-hook! inferior-python-mode :append (yas-activate-extra-mode 'python-mode))
(add-hook! inferior-python-mode :append (python-mls-mode))
(add-hook! inferior-ess-r-mode :append (yas-activate-extra-mode 'ess-mode))

;; faces ------------------------------
;;
(custom-set-faces
 '(magit-branch-current ((t (:foreground "#8CD0D3" :box (:line-width 1 :color "#8CD0D3")))))
 '(org-headline-done ((t (:foreground "gray42")))))

;; LaTeX stuff ------------------------------

;; set the default reftex bibliography file
;; make reftex use the bibtex backend
;; use Okular by default to view PDFs
(after! tex
  (setq TeX-view-program-selection '((output-pdf "Okular")
                                     (output-dvi "Okular")
                                     (output-html "xdg-open")))
  (setq reftex-default-bibliography '("/home/timh/texmf/bibtex/bib/carbon.bib"))
  (setq reftex-cite-format 'natbib)
)
