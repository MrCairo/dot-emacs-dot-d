;;; python-settings --- Summary
;;;  A package for all settings that are Python related.
;;;
;;; Commentary:
;;; -----------------------

(require 'python)
(require 'linum)
(require 'python-environment)
(require 'pylookup-settings)
;;; Code:

;; ------------------
;; misc python config
;; ------------------

(defvar list-python_packages
  '(
    column-enforce-mode
    elpy
    flycheck-pyflakes
    jedi
    jedi-core
    jedi-direx
    pydoc
    python
    whitespace
;;    fill-column-indicator
    ))

(defun python-shell-parse-command ()
  "Return the string used to execute the inferior Python process."
  "/usr/local/bin/python3 -i"
  )

(mapc #'(lambda (package)
    (unless (package-installed-p package)
     (package-install package)))
      list-python_packages)

(setq elpy-modules (quote
		    (elpy-module-company
		     elpy-module-eldoc
		     elpy-module-pyvenv
		     elpy-module-yasnippet
		     elpy-module-django
		     elpy-module-sane-defaults)))

(elpy-enable)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(use-package flycheck
   :ensure t
   :init (global-flycheck-mode))

(setq flycheck-python-flake8-executable "python3")

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; pyflakes flymake integration
;; http://stackoverflow.com/a/1257306/347942
;; (when (load "flymake" t)
;;   (defun flymake-pyflakes-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list "pycheckers" (list local-file))))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pyflakes-init)))

(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'python-mode-hook
	  (lambda ()
	    (unless (eq buffer-file-name nil) (flymake-mode 1))
	    (local-set-key (kbd "M-p") 'python-nav-backward-defun)
	    (local-set-key (kbd "M-n") 'python-nav-forward-defun)
	    (local-set-key (kbd "C-c ^") 'elpy-pdb-break-at-point)
	    (local-set-key (kbd "C-c p") 'pylookup-lookup-at-point)
	    (local-set-key (kbd "C-c h") 'pylookup-lookup)
	    (column-enforce-mode)
	    (setq python-shell-interpreter "python3")
	    (setq elpy-rpc-python-command "python3")
	    (setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
	    (ggtags-mode 1)
	    (setq column-enforce-column 79)
	    ;;(visual-line-mode t)
	    ;;(whitespace-mode t)
	    ;;(display-line-numbers-mode t)
	    ;;(setq linum-format "%d\u2502 ")
	    ))

; Set PYTHONPATH, because we don't load .bashrc
(defun set-python-path-from-shell-PYTHONPATH ()
  "Sets the PYTHONPATH variable whenever an Emacs shell is openend"
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PYTHONPATH'")))
    (setenv "PYTHONPATH" path-from-shell)))

(if window-system (set-python-path-from-shell-PYTHONPATH))

(setq auto-mode-alist
      (append
       (list '("\\.pyx" . python-mode)
             '("SConstruct" . python-mode))
       auto-mode-alist))

(defun enable-jedi ()
  "Enables the Python auto-completion package"
  (eval-after-load "python"
    '(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer))
  (add-hook 'python-mode-hook (lambda()
				(jedi:setup)
				(jedi-direx:setup)
				(setq jedi:complete-on-dot t)
				(setq jedi:environment-root "jedi")  ; or any other name you like
				(setq jedi:setup-keys t)
				(setq jedi:server-command
				      (list "/usr/local/bin/python3" jedi:server-script))
				(setq jedi:environment-virtualenv
				      (append python-environment-virtualenv
					      '("--python" "/usr/local/bin/python3")))
				))
  )

(provide 'python-settings)

;;; python-settings.el ends here
