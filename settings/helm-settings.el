;;; helm-settings --- Summary
;;; General settings for the helm plugin
;;;
;;; Commentary:
;;; -----------------------

;;; Code:

(require 'helm)

(unless (package-installed-p 'helm-descbinds)
  (package-install 'helm-descbinds))

(require 'helm-descbinds)

(fset 'describe-bindings 'helm-descbinds)
(helm-mode 1)

(global-set-key (kbd "C-c h") 'helm-mini)

(provide 'helm-settings)

;;; helm-settings.el ends here
