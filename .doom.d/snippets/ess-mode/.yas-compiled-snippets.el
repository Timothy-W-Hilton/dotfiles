;;; Compiled snippets and support files for `ess-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'ess-mode
                     '(("within" "$1 <- within($1, {\n`yas/selected-text`$0\n})" "within" nil nil nil "/home/timh/.doom.d/snippets/ess-mode/within.yasnippet" nil nil)
                       ("while" "while ($1) {\n`yas/selected-text`$0\n}" "while ( ... ) { ... }" nil nil nil "/home/timh/.doom.d/snippets/ess-mode/while.yasnippet" nil nil)
                       ("setGeneric" "setGeneric(\"${1:function}\", function(${2:arguments}, ...) standardGeneric(\"$1\"))\n" "setGeneric" nil nil nil "/home/timh/.doom.d/snippets/ess-mode/setGeneric.yasnippet" nil nil)
                       ("set.seed" "set.seed(`(random 2147483647)`)" "set.seed" nil nil nil "/home/timh/.doom.d/snippets/ess-mode/set.seed.yasnippet" nil nil)
                       ("s3method" "${1:function} <- function(${2:x}, ...) {\nUseMethod(\"$1\")\n}\n$0" "s3method.yasnippet" nil nil nil "/home/timh/.doom.d/snippets/ess-mode/s3method.yasnippet" nil nil)
                       ("repeat" "repeat {\n`yas/selected-text`$0\n}" "repeat { ... }" nil nil nil "/home/timh/.doom.d/snippets/ess-mode/repeat.yasnippet" nil nil)
                       ("printwide" "with(options(width={${1:181}), print(`yas/selected-text`$0))" "printwide" nil nil nil "/home/timh/.doom.d/snippets/ess-mode/printwide.yasnippet" nil nil)
                       ("ifelse" "if ($1) {\n   `yas/selected-text`$2\n} else {\n   $0\n}\n" "if (...) { ... } else { ... }" nil nil nil "/home/timh/.doom.d/snippets/ess-mode/ifelse.yasnippet" nil nil)
                       ("if" "if (${1:condition}) {\n`yas/selected-text`$0\n} \n" "if (...) { ... }" nil nil nil "/home/timh/.doom.d/snippets/ess-mode/if.yasnippet" nil nil)
                       ("func" "${1:name} <- function(${2:args}) {\n`yas/selected-text`$0\n}" "FUNC <- function(...) { ... }" nil nil nil "/home/timh/.doom.d/snippets/ess-mode/function.yasnippet" nil nil)
                       ("for" "for (${1:i} in ${2:vector}) {\n`yas/selected-text`$0\n}" "for ( ... in ...) { ... }" nil nil nil "/home/timh/.doom.d/snippets/ess-mode/for.yasnippet" nil nil)
                       ("else" "else {\n`yas/selected-text`$0\n}\n" "else" nil nil nil "/home/timh/.doom.d/snippets/ess-mode/else.yasnippet" nil nil)
                       ("elif" "else if ($1) {\n`yas/selected-text`$0\n} \n\n" "else if" nil nil nil "/home/timh/.doom.d/snippets/ess-mode/elif.yasnippet" nil nil)
                       ("dev" "${1:$$(yas/choose-value '(\"pdf\" \"postscript\" \"pictex\" \"png\" \"jpeg\" \"bmp\" \"tiff\" \"xfig\" \"bitmap\" \"X11\" \"cairo_pdf\" \"quartz\"))}($2)\n`yas/selected-text`$0\ndev.off()" "grDevice" nil nil nil "/home/timh/.doom.d/snippets/ess-mode/dev.yasnippet" nil nil)
                       ("br" "browser()\n$0\n" "R breakpoint" t nil nil "/home/timh/.doom.d/snippets/ess-mode/breakpoint.yasnippet" nil "")))


;;; Do not edit! File generated at Mon Jul  3 16:32:10 2023
