;;
;; Load packages if not already loaded.
;; --------------------------------------

(require 'package)
(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)


;; Comment out if you've already loaded this package...
(require 'cl-lib)

(defvar my-packages '(
		      better-defaults
		      exec-path-from-shell
		      auto-complete
		      material-theme
		      helm
		      helm-descbinds
		      js2-mode
		      js2-refactor
		      xref-js2
		      )
  "A list of packages to ensure are installed at launch.")

(defun my-packages-installed-p ()
  (cl-loop for p in my-packages
           when (not (package-installed-p p)) do (cl-return nil)
           finally (cl-return t)))

(unless (my-packages-installed-p)
  ;; check for new packages (package versions)
  (package-refresh-contents)
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
(add-hook 'js2-mode-hook (lambda ()
			   (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

(provide 'js-package-settings)
