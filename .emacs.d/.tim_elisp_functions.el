
;;==============================================================
;;==============================================================
;; helper functions -- where are we?
;;==============================================================
;;==============================================================

(defun system-is-mac ()
  (interactive)
  (string-equal system-type "darwin"))

(defun system-is-linux ()
  (interactive)
  (string-equal system-type "gnu/linux"))


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


;;==============================================================

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


(defun isearch-occur ()
  "Invoke `occur' from within isearch."
  (interactive)
  (let ((case-fold-search isearch-case-fold-search))
    (occur (if isearch-regexp isearch-string (regexp-quote isearch-string)))))
(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)


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

;;--------------------------------------------------
;; insert current date as YYYY-MM-DD
(defun insert-current-date () (interactive)
    (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d)")))


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

;; --------------------------------------------------
(defun path-to-ospathjoin (ξstring &optional ξfrom ξto)
  "format a *nix path for python's os.path.join

When called interactively, work on current paragraph or text selection.

When called in lisp code, if ξstring is non-nil, returns a changed string.
If ξstring nil, change the text in the region between positions ξfrom ξto.

adapted from:
http://ergoemacs.org/emacs/elisp_command_working_on_string_or_region.html
https://www.gnu.org/software/emacs/manual/html_node/elisp/Mapping-Functions.html

Timothy W. Hilton
"
  (interactive
   (if (use-region-p)
       (list nil (region-beginning) (region-end))
     (let ((bds (bounds-of-thing-at-point 'paragraph)) )
       (list nil (car bds) (cdr bds)) ) ) )

  (let (workOnStringP inputStr outputStr)
    (setq workOnStringP (if ξstring t nil))
    (setq inputStr (if workOnStringP ξstring (buffer-substring-no-properties ξfrom ξto)))
    (setq outputStr
          (let
	      ((case-fold-search t)
	       (tmp_list (split-string inputStr "/")))
	    (setq tmp_list (cons "/" (cdr tmp_list)))
	    (setq resultString (mapconcat
				(function (lambda (x) (format "'%s'" x)))
				tmp_list
				", "))
	    (setq outputStr (format "os.path.join(%s)" resultString))
	  ))
    (if workOnStringP
        outputStr
      (save-excursion
        (delete-region ξfrom ξto)
        (goto-char ξfrom)
        (insert outputStr) )) ) )
