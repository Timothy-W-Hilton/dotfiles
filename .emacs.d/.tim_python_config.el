;;--------------------------------------------------
;; PYTHON STUFF
;; pilfered from http://www.jesshamrick.com/2012/09/18/emacs-as-a-python-ide/
;; (require 'python-mode)
;;(require 'ein)

; use elpy (IDE for emacs)
(package-initialize)
(elpy-enable)

;; jupyter console is recommended by elpy for interactive python
;; prompt as of 4 May 2021:
;; https://elpy.readthedocs.io/en/latest/ide.html#interpreter-setup
;; The below setup code is taken directly from that link.  As of 4 May
;; 2021, tab completion works out of the box using jupyter console,
;; and does not work out of the box using ipython.
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
	     "jupyter")

(define-key inferior-python-mode-map (kbd "C-c p") 'path-to-ospathjoin)
(define-key python-mode-map (kbd "C-c p") 'path-to-ospathjoin)

(defun python-insert-breakpoint ()
  "insert 'breakpoint()' on a new line following point."
  ;;Previously inserted 'import pdb; pdb.set_trace()' at point.  Python
  ;;3.7 added the builtin function breakpoint() as a convenience
  (interactive)
  (newline-and-indent)
  (insert "import pdb; pdb.set_trace()")
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
