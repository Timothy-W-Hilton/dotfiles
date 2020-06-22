;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
;; IMPORTANT: Tou must place this *before* any CEDET component (including
;; EIEIO) gets activated by another package (Gnus, auth-source, ...).
;;(load-file "/home/tim/.emacs.d/cedet-bzr/trunk/cedet-devel-load.el")

;; Add further minor-modes to be enabled by semantic-mode.
;; See doc-string of `semantic-default-submodes' for other things
;; you can use here.
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode t)
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode t
;; )
;; (add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode t)

;; ;; Enable Semantic
;; (semantic-mode 1)

;; ;; Enable EDE (Project Management) features
;; (global-ede-mode 1)

;==============================================================
;==============================================================
; helper functions -- where are we?
;==============================================================
;==============================================================



(defun system-is-mac ()
  (interactive)
  (string-equal system-type "darwin"))

(defun system-is-linux ()
  (interactive)
  (string-equal system-type "gnu/linux"))

;==============================================================
;==============================================================
; don't open GUI windows!

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
;==============================================================
;==============================================================

;==============================================================
;==============================================================
; default window width and height
;==============================================================
;==============================================================

(defun custom-set-frame-size ()
  (add-to-list 'default-frame-alist '(height . 50))
  (add-to-list 'default-frame-alist '(width . 177)))
(custom-set-frame-size)
(add-hook 'before-make-frame-hook 'custom-set-frame-size)


;==============================================================
;==============================================================
; paths, etc.
;==============================================================
;==============================================================

(add-to-list 'load-path "~/.emacs.d/ein")
(add-to-list 'load-path "~/.emacs.d/post")
(add-to-list 'load-path "/Users/tim/.emacs.d/elpa/solarized-theme-20190513.705/") ; new
(add-to-list 'custom-theme-load-path "/Users/tim/.emacs.d/elpa/solarized-theme-20190513.705/") ; new

(server-start) ;;; For use with emacsclient

;;--------------------------------------------------
;; the two auctex lines below seem to:
;; (1) need to come before the package manager stuff
;; (2) get overridden by ;; (add-to-list 'load-path "~/.emacs.d/elpa/auctex-11.87.6")
;(load "auctex.el" nil t t)
;(load "preview-latex.el" nil t t)

;;--------------------------------------------------
;; use marmalade to manage packages
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

; set up auto complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete/dict")
(ac-config-default)

(require 'shell-switcher)

; use pdf-tools instead of DocView for pdfs
; commented out 9 Dec 2019; has been issuing startup errors for a while
;; (pdf-tools-install)
;; (setq pdf-view-resize-factor 1.05)

;; ;;--------------------------------------------------
;; ;; USE MATLAB MODE FOR MATLAB CODE

;; ;(load-library "matlab-load")
;; (require 'matlab-load)
;; (setq matlab-shell-command-switches '("-nosplash -nodesktop"))
;; ;(matlab-cedet-setup)

;; ;; ; Setup matlab mode
;; (defun matlab-insert-continuation ()
;;   "insert ...\n at point (matlab line continuation symbol)"
;;   (interactive)
;;   (insert "...\n")
;; )

;; (defun matlab-delete-indentation ()
;;   "Join this line to previous and fix up whitespace at
;; join,removing '...' from previous line If there is a fill
;; prefix,delete it from the beginning of this line.  With argument,
;; join this line to following line."
;;   (interactive)
;;   (delete-indentation)
;;   (save-excursion
;;     (let ( p1 p2 )
;;       (setq p1 (point))
;;       (skip-chars-backward "\\. ") (setq p2 (point))
;;       (delete-region p1 p2))))

;; (defun my-matlab-mode-hook ()
;;   (setq fill-column 80)
;;   ;(auto-complete-mode 1)
;;   (setq matlab-fill-fudge 0 )
;;   (setq matlab-fill-fudge-hard-maximum 82 )
;;   (setq matlab-indent-function-body nil)
;;   (local-set-key (kbd "M-;") 'comment-dwim)
;;   (local-set-key (kbd "<C-return>") 'matlab-insert-continuation)
;;   (local-set-key (kbd "M-^") 'matlab-delete-indentation))

;; (defun my-matlab-shell-mode-hook ()
;;   (local-set-key (kbd "C-<return>") 'matlab-insert-continuation)
;;   (local-set-key (kbd "M-^") 'matlab-delete-indentation))

;; (add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
;; (add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)


;==============================================================
;==============================================================
; setup CEDET
;==============================================================
;==============================================================

;==============================================================
;==============================================================
; how stuff looks - font lock, colors, etc.
;==============================================================
;==============================================================

; ls switches for dired mode
(setq dired-listing-switches "-alh")

; no splash screen
(setq inhibit-splash-screen 1)

;; use zenburn theme
(load-theme 'zenburn 1)

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

; specify particular modes for particular files
(add-to-list 'auto-mode-alist '("\\.muttrc.*" . conf-mode))
(add-to-list 'auto-mode-alist '("\\..*rc" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.pbs\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("^[Mm]akefile\\'" . shell-script-mode))
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . diff-mode))

;;--------------------------------------------------
;; define functions to rotate windows and bind to C-c w
(defun rotate-windows-helper(x d)
  (if (equal (cdr x) nil) (set-window-buffer (car x) d)
    (set-window-buffer (car x) (window-buffer (cadr x))) (rotate-windows-helper (cdr x) d)))

(defun rotate-windows ()
  (interactive)
  (rotate-windows-helper (window-list) (window-buffer (car (window-list))))
  (select-window (car (last (window-list)))))

; bind to the key super-r
(global-set-key (kbd "C-c w") 'rotate-windows)

(defun generate-buffer ()
  (interactive)
  (switch-to-buffer (make-temp-name "scratch")))

;;--------------------------------------------------
;; define function to set transparency
 (defun transparency (value)
   "Sets the transparency of the frame window. 0=transparent/100=opaque"
   (interactive "nTransparency Value 0 - 100 opaque:")
   (set-frame-parameter (selected-frame) 'alpha value))
;; set it to 90% opaque
(transparency 90)

;;--------------------------------------------------
;; define function to capitalize the word behind point, bind to M-U
;; now M-u is bound to upcase-word and M-U is bound to upcase-word-back
(defun upcase-word-back ()
  ;; capitalize the word behind point
   ( interactive )
   ( upcase-word -1 )
)
(global-set-key (kbd "M-U") 'upcase-word-back)

(defun join-lines () (interactive)
  ;; join all lines in region into one line
 (setq fill-column 100000)
 (fill-paragraph nil)
 (setq fill-column 78)
)

;;; A unfill-paragraph that works in lisp modes
;;; from http://www.emacswiki.org/emacs/UnfillParagraph, 4 Dec 2015
(defun unfill-paragraph (&optional region)
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
	(emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))
;; Handy key definition
(define-key global-map "\M-Q" 'unfill-paragraph)

(defun unfill-region (beg end)
  "Unfill the region, joining text paragraphs into a single
    logical line.  This is useful, e.g., for use with
    `visual-line-mode'."
  (interactive "*r")
  (let ((fill-column (point-max)))
    (fill-region beg end)))

;==============================================================
;==============================================================
; functionality -- completion, packages, spelling, etc.
;==============================================================
;==============================================================

; delete trailing whitespace before saving
(add-hook 'before-save-hook
          'delete-trailing-whitespace)

(setq ispell-program-name "aspell")

(defvar ispell-tex-skip-alists
  '((("%\\[" . "%\\]")
     ;; All the standard LaTeX keywords from L. Lamport's guide:
     ;; \cite, \hspace, \hspace*, \hyphenation, \include, \includeonly, \input,
     ;; \label, \nocite, \rule (in ispell - rest included here)
     ("\\\\addcontentsline"              ispell-tex-arg-end 2)
     ("\\\\add\\(tocontents\\|vspace\\)" ispell-tex-arg-end)
     ("\\\\\\([aA]lph\\|arabic\\)"	 ispell-tex-arg-end)
     ("\\\\author"			 ispell-tex-arg-end)
     ("\\\\bibliographystyle"		 ispell-tex-arg-end)
     ("\\\\makebox"			 ispell-tex-arg-end 0)
     ;;("\\\\epsfig"		ispell-tex-arg-end)
     ("\\\\document\\(class\\|style\\)" .
      "\\\\begin[ \t\n]*{[ \t\n]*document[ \t\n]*}"))
    (;; delimited with \begin.  In ispell: displaymath, eqnarray, eqnarray*,
     ;; equation, minipage, picture, tabular, tabular* (ispell)
     ("\\(figure\\|table\\)\\*?"  ispell-tex-arg-end 0)
     ("list"			  ispell-tex-arg-end 2)
     ("program"		. "\\\\end[ \t\n]*{[ \t\n]*program[ \t\n]*}")
     ("verbatim\\*?"	. "\\\\end[ \t\n]*{[ \t\n]*verbatim\\*?[ \t\n]*}")
     ("gather\\*?"	. "\\\\end[ \t\n]*{[ \t\n]*gather\\*?[ \t\n]*}"))))

;;--------------------------------------------------
;; make GUI emacs use the same environment variables as the shell on
;; OS X (for selected variables)
(when (memq window-system '(ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "PATH")
  (exec-path-from-shell-copy-env "PLOTS")
  (exec-path-from-shell-copy-env "BIBINPUTS")
  (exec-path-from-shell-copy-env "BSTINPUTS")
  (exec-path-from-shell-copy-env "TEXINPUTS"))

;;--------------------------------------------------
;;don't let OS X trap command functions in emacs
(setq mac-pass-command-to-system 'nil)
(setq mac-pass-control-to-system 'nil)

;;--------------------------------------------------
;; page up, then page down returns point to original position
(setq scroll-preserve-screen-position t)

;;--------------------------------------------------
;; use ido to complete file names, etc.
(require 'ido)
(ido-mode t)

; use ido from ibuffer menu
(defun ibuffer-ido-find-file (file &optional wildcards)
  "Like `ido-find-file', but default to the directory of the buffer at point."
  (interactive
   (let ((default-directory
           (let ((buf (ibuffer-current-buffer)))
             (if (buffer-live-p buf)
                 (with-current-buffer buf
                   default-directory)
               default-directory))))
     (list (ido-read-file-name "Find file: " default-directory) t)))
  (find-file file wildcards))

;;--------------------------------------------------
;; enable auto-complete mode for coding
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (require 'auto-complete-config)
;; (ac-config-default)

;;--------------------------------------------------
;; use post-mode for email

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


;;--------------------------------------------------
;; use windmove to navigate windows
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))

;;--------------------------------------------------
;; set up jabber
(setq jabber-account-list
      '(("timothy.w.hilton@gmail.com"
	 (:network-server . "talk.google.com")
	 (:connection-type . ssl))))

;;--------------------------------------------------
;; enable visual paren-matching
(show-paren-mode 1)

;;--------------------------------------------------
;; shortcut for Magit status buffer
(global-set-key (kbd "C-x g") 'magit-status)

;;--------------------------------------------------
;; use ESS (Emacs Speaks Statistics) for R code, processes
(require 'ess-site)   ; this doesn't seem to work if ess not installed from elpa -- TWH 5 Nov 2013
;; (load "~/.emacs.d/ess-14.09/lisp/ess-site")

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
;;--------------------------------------------------
;; USE IBUFFER FOR BUFFER MENU

(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; (defalias 'list-buffers 'ibuffer)
;; use mode-name as default sorting mode
(setq-default ibuffer-default-sorting-mode 'mode-name)

; this just takes the default ibuffer column format and increases the
; buffername column width from 18 to 30
(setq ibuffer-formats '((mark modified read-only " "
       (name 30 30 :left :elide)
       " "
       (size 9 -1 :right)
       " "
       (mode 16 16 :left :elide)
       " " filename-and-process)
 (mark " "
       (name 16 -1)
       " " filename)))

; use ido find file from within ibuffer, starting from the directory at point
(define-key ibuffer-mode-map "\C-x\C-f" 'ibuffer-ido-find-file)

;;--------------------------------------------------
;; USE TRAMP FOR EDITING REMOTE FILES

(setq tramp-auto-save-directory "~/emacs.d/tramp-autosave")
; tell tramp to ignore version control stuff in remote directories
(setq vc-ignore-dir-regexp
       (format "\\(%s\\)\\|\\(%s\\)"
	       vc-ignore-dir-regexp
	       tramp-file-name-regexp))

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; LATEX STUFF

;(load "auctex.el" nil t t)
;(load "preview-latex.el" nil t t)

;; (if (system-is-mac)
;;     (progn
;;       ; now installing auctex via ELPA so don't need require statements
;;       ;(require 'tex-site)
;;       ;(require 'font-latex)
;;       (setq TeX-view-program-list
;; 	    (quote
;; 	     (("Skim"
;; 	       (concat "/Applications/Skim.app/"
;; 		       "Contents/SharedSupport/displayline"
;; 		       " %n %o %b")))))
;;       (setq TeX-view-program-selection
;; 	    (quote (((output-dvi style-pstricks) "dvips and gv")
;; 		    (output-dvi "xdvi")
;; 		    (output-pdf "Skim")
;; 		    (output-html "xdg-open"))))))

;; ;; to use pdfview with auctex
;; (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
;;     TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
;;     TeX-source-correlate-start-server t) ;; not sure if last line is neccessary

 ;; to have the buffer refresh after compilation
(add-hook 'TeX-after-compilation-finished-functions
	  #'TeX-revert-document-buffer)

; use OSX open command to open pdfs when compiling latex
;; (setq TeX-view-program-list '(("Preview" "open %o")))
;; (setq TeX-view-program-selection '((output-pdf "Preview")))

;; (if (system-is-linux)
;;     (setq TeX-view-program-selection
;; 	  (quote (((output-dvi style-pstricks) "dvips and gv")
;; 		  (output-dvi "xdvi")
;; 		  (output-pdf "evince"
;; 			      (output-html "xdg-open"))))))

; compile LaTeX to PDF, not DVI
'(TeX-PDF-mode 1)

;enable reftex
(add-hook 'LaTeX-mode-hook
      (lambda ()
        (reftex-mode t)
        (flyspell-mode t)
	))
'(reftex-use-external-file-finders t)
(setq reftex-default-bibliography '("/Users/tim/Library/texmf/bibtex/bib/carbon.bib"))
;(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-auctex t)
; use natbib as the default bibliography style -- this causes reftex
; to prompt for the citation format (cite, citet, citea, etc)
(setq reftex-cite-format 'natbib)

(add-hook 'pandoc-mode-hook
      (lambda ()
        (reftex-mode t)
        (flyspell-mode t)
	;; configure reftex for use with pandoc-mode
	(setq reftex-default-bibliography
	      '("/Users/tim/Library/texmf/bibtex/bib/carbon.bib"))

	;; (eval-after-load 'reftex-vars
	;;   '(progn
	;;      ;; (also some other reftex-related customizations)
	;;      (setq reftex-cite-format
	;; 	   '((?\C-m . "[@%l]")
	;; 	     (?t . "@%l")
	;; 	     (?a . "[-@%l]")))))

	;; (eval-after-load 'reftex-vars
	;;   '(progn
	;;      (setq reftex-cite-format '((?\C-m . "[@%l]")))))

	)
      )


;;--------------------------------------------------
;; PYTHON STUFF
;; pilfered from http://www.jesshamrick.com/2012/09/18/emacs-as-a-python-ide/
;; (require 'python-mode)
;(require 'ein)

; use elpy (IDE for emacs)
(package-initialize)
(elpy-enable)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
;; ;;; needed for ipython 5.x and elpy (http://emacs.stackexchange.com/questions/24453/weird-shell-output-when-using-ipython-5)
;; ;; (custom-set-variables
;; ;;  '(python-shell-interpreter-args "--simple-prompt -i"))
;; (setq python-shell-interpreter "ipython" python-shell-interpreter-args "--simple-prompt --pprint")

(load "~/.emacs.d/path-to-ospathjoin.el")
(define-key inferior-python-mode-map (kbd "C-c p") 'path-to-ospathjoin)
(define-key python-mode-map (kbd "C-c p") 'path-to-ospathjoin)

(defun python-insert-breakpoint ()
  "insert 'breakpoint()' on a new line following point."
  ;Previously inserted 'import pdb; pdb.set_trace()' at point.  Python
  ;3.7 added the builtin function breakpoint() as a convenience
  (interactive)
  (newline-and-indent)
  (insert "breakpoint()")
)

(defun python-show-function-definitions ()
  "open a buffer showing all python function definitions"
  (interactive)
  (occur "^def")
  (switch-to-buffer-other-frame "*Occur*"))

(defun matplotlib-close-plots ()
  "insert 'plt.close('all')' at point"
  (interactive)
  (insert "plt.close('all')"))

(defun matplotlib-show-plots ()
  "insert 'plt.close('all')' at point"
  (interactive)
  (insert "plt.show()"))

(defun pyshell-plot-stuff ()
  "insert code at point to initialize plotting"
  (interactive)
  (insert "import matplotlib
	  matplotlib.use(\"TkAgg\")
	  from matplotlib import pyplot as plt"))


(defun isearch-occur ()
  "Invoke `occur' from within isearch."
  (interactive)
  (let ((case-fold-search isearch-case-fold-search))
    (occur (if isearch-regexp isearch-string (regexp-quote isearch-string)))))
(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)

(define-key python-mode-map (kbd "C-c b") 'python-insert-breakpoint)
(define-key python-mode-map (kbd "C-c f") 'python-show-function-definitions)
(define-key inferior-python-mode-map (kbd "C-c c") 'matplotlib-close-plots)
(define-key inferior-python-mode-map (kbd "C-c s") 'matplotlib-show-plots)
(define-key inferior-python-mode-map (kbd "C-c l") 'pyshell-pylab)
(defun my-python-mode-hook ()
  (local-set-key (kbd "C-c C-b") 'python-insert-breakpoint))
(add-hook 'py-mode-hook 'my-python-mode-hook)

;;--------------------------------------------------
;; org mode
(add-hook 'inferior-org-mode-hook
          (lambda()
	    (local-set-key (kbd "M-q") 'org-fill-paragraph)))

;;--------------------------------------------------
;; ediff options
(setq ediff-diff-options " -b -w ")


;;--------------------------------------------------
;; fortran stuff
(require 'f90-interface-browser)

;;--------------------------------------------------
;; complete file names within a buffer
(defun my-insert-file-name (filename &optional args)
    "Insert name of file FILENAME into buffer after point.

  Prefixed with \\[universal-argument], expand the file name to
  its fully canocalized path.  See `expand-file-name'.

  Prefixed with \\[negative-argument], use relative path to file
  name from current directory, `default-directory'.  See
  `file-relative-name'.

  The default with no prefix is to insert the file name exactly as
  it appears in the minibuffer prompt."
    ;; Based on insert-file in Emacs -- ashawley 20080926
    (interactive "*fInsert file name: \nP")
    (cond ((eq '- args)
           (insert (file-relative-name filename)))
          ((not (null args))
           (insert (expand-file-name filename)))
          (t
           (insert filename))))

(global-set-key "\C-c\C-i" 'my-insert-file-name)

;;--------------------------------------------------
;; insert current date as YYYY-MM-DD
(defun insert-current-date () (interactive)
    (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d)")))

;;--------------------------------------------------
;; insert current date as YYYY-MM-DD within markdown level-3 header
(defun markdown-insert-date-header ()
  (interactive)
  (markdown-insert-header-atx-3)
  (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d)"))
  (end-of-line 2))

(defun markdown-insert-meeting-with-elliott ()
  (interactive)
  (markdown-insert-header-atx-3)
  (insert "e-meeting with Elliott"))

(defun my-markdown-mode-keys ()
  "my keys for `markdown-mode'."
  (interactive)
  (local-set-key (kbd "C-c d") 'markdown-insert-date-header)
  (local-set-key (kbd "C-c e") 'markdown-insert-meeting-with-elliott))
(add-hook 'markdown-mode-hook 'my-markdown-mode-keys)

;;--------------------------------------------------
;; functions I find useful

;; https://www.emacswiki.org/emacs/FindingNonAsciiCharacters
(defun find-first-non-ascii-char ()
  "Find the first non-ascii character from point onwards."
  (interactive)
  (let (point)
    (save-excursion
      (setq point
            (catch 'non-ascii
              (while (not (eobp))
                (or (eq (char-charset (following-char))
                        'ascii)
                    (throw 'non-ascii (point)))
                (forward-char 1)))))
    (if point
        (goto-char point)
        (message "No non-ascii characters."))))

(fset 'euro
      (lambda (&optional arg) "Keyboard macro."
	(interactive "p")
	(kmacro-exec-ring-item
	 (quote ([24 56 return 35 120 50 48 65 67 return] 0 "%d"))
	 arg)))

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
