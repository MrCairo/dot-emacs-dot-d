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
      		      helm
		      helm-descbinds
		      yasnippet
		      yaml-mode
		      elpy
		      php-mode
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

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

(provide 'py-package-settings)
