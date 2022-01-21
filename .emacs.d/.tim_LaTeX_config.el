;;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; LATEX STUFF

;;(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)

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

;; compile LaTeX to PDF, not DVI
'(TeX-PDF-mode 1)

;;enable reftex
(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (reftex-mode t)
	    (flyspell-mode t)
	    ))
'(reftex-use-external-file-finders t)
(setq reftex-default-bibliography '("/Users/tim/Library/texmf/bibtex/bib/carbon.bib"))
;;(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-auctex t)
;; use natbib as the default bibliography style -- this causes reftex
;; to prompt for the citation format (cite, citet, citea, etc)
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

;; include braces around certain expressions in titles in tasks
;; performed by bibtex-clean-entry
(setq bibtex-entry-format '(opts-or-alts required-fields numerical-fields braces))
;; regexps to enclose in braces (to preserve capitalization) in bibtex titles
(setq bibtex-field-braces-alist
      '((("title") "CH\\(4\\|\\$_4\\$\\)?")  ;; match CH4 or CH$_4$
	(("title") "NO[x2]")
	(("title") "CO\\(2\\|\\$2\\$\\)?")  ;; match CO2 or CO$_2$
	(("title") "Asia")
	(("title") "Europe")
	(("title") "America")
	))
