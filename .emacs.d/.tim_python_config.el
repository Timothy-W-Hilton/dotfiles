;;--------------------------------------------------
;; PYTHON STUFF
;; pilfered from http://www.jesshamrick.com/2012/09/18/emacs-as-a-python-ide/
;; (require 'python-mode)
;;(require 'ein)

; use elpy (IDE for emacs)
(package-initialize)
(elpy-enable)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
;; ;;; needed for ipython 5.x and elpy (http://emacs.stackexchange.com/questions/24453/weird-shell-output-when-using-ipython-5)
;; ;; (custom-set-variables
;; ;;  '(python-shell-interpreter-args "--simple-prompt -i"))
;; (setq python-shell-interpreter "ipython" python-shell-interpreter-args "--simple-prompt --pprint")

(define-key inferior-python-mode-map (kbd "C-c p") 'path-to-ospathjoin)
(define-key python-mode-map (kbd "C-c p") 'path-to-ospathjoin)

(defun python-insert-breakpoint ()
  "insert 'breakpoint()' on a new line following point."
  ;;Previously inserted 'import pdb; pdb.set_trace()' at point.  Python
  ;;3.7 added the builtin function breakpoint() as a convenience
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
