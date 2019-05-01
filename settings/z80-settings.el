;-------------------;
;;;   Z80-mode    ;;;
;-------------------;

(require 'z80-mode)
(add-to-list 'auto-mode-alist '("\\.z80\\'" . z80-mode))
(add-to-list 'auto-mode-alist '("\\.asm\\'" . z80-mode))

(provide 'z80-settings)
