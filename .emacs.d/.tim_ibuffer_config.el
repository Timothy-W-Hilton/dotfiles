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
