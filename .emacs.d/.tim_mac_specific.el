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
