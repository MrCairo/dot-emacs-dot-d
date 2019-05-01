;;
;; Settings for the telephone-line package
;;
(require 'telephone-line)

;;; Code:

(setq telephone-line-primary-right-separator 'telephone-line-abs-left
      telephone-line-secondary-right-separator 'telephone-line-abs-hollow-left)

(setq telephone-line-height 24
      telephone-line-evil-use-short-tag t)

(telephone-line-mode 1)

(provide 'telephone-line-settings)

;;; telephone-line-settings.el ends here
