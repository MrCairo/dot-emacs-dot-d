
;;; Code:
(elpy-enable)

;; use flycheck not flymake
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(custom-set-variables
 '(elpy-rpc-python-command "python3")
 '(python-shell-interpreter "python3")
)

(provide 'elpy-settings)

;;; elpy-settings.el ends here
