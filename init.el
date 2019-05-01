;;; init.el --- Emacs configuration

;;; Commentary:
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; Code:
(add-to-list 'load-path "~/.emacs.d/settings")

;;
;; Load packages if not already loaded.
;; --------------------------------------

(require 'cl-lib)
(require 'package)
(require 'custom-functions)

(setq warning-minimum-level :warnings)

(add-to-path "/usr/local/bin")
(add-to-path "/usr/local/opt/bin")

;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t))
(package-initialize)

;;(when (not package-archive-contents)
;; (package-refresh-contents))

(defvar my-packages
  '(
    auto-complete
    better-defaults
;;    cyberpunk-theme
    deferred
;;    doom-themes
    exec-path-from-shell
    flycheck
    ggtags
    guide-key
;;    helm
    ivy
    magit
    material-theme
    md4rd
;;    moe-theme
    org
;;    powerline
    use-package
    w3m
    yasnippet
    ))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      my-packages)


;;;(require 'js-package-settings)
(require 'general-settings)
(require 'ivy-settings)
;;(require 'helm-settings)

(require 'python-settings)

(setenv "PYTHONPATH" "/Users/game_devr/development/Python/mod_dev/pygbasm")

(enable-jedi)

(set-face-attribute 'default nil
		    :font "-*-Menlo-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1" )
(set-frame-font "-*-Menlo-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1" nil t)
(add-to-list 'default-frame-alist
             '(font . "-*-Menlo-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1"))

;; (load-theme 'doom-sourcerer t)
;; (load-theme 'doom-Iosvkem t)
(load-theme 'material t)
;; (load-theme 'moe-dark t)
;; (load-theme 'leuven t)
;; (load-theme 'deeper-blue t)
;; install dependencies with el-get
;; (require 'el-get-settings)

(global-flycheck-mode t)

;;
;; Z80 Mode. Note: This is not a package mamnaged by the package manager.
;;                 It is stand-alone as z80-mode.el
(require 'z80-settings)
(require 'auto-complete-settings)

;;
;; w3m setup
(require 'web-settings)

(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-c" "C-x"))
(guide-key-mode 1)

;;;
;;; gnus
;;;
;; (setq gnus-select-method
;;     '(nntp "news.eternal-september.org"
;;            (nntp-port-number 119)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#303030" "#ff4b4b" "#d7ff5f" "#fce94f" "#5fafd7" "#d18aff" "#afd7ff" "#c6c6c6"])
 '(async-bytecomp-package-mode t)
 '(current-language-environment "Latin-1")
 '(default-input-method "latin-1-prefix")
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(global-font-lock-mode t nil (font-lock))
 '(hl-sexp-background-color "#1c1f26")
 '(jdee-db-active-breakpoint-face-colors (cons "#100e23" "#906cff"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#100e23" "#95ffa4"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#100e23" "#565575"))
 '(package-selected-packages
   (quote
    (magit column-enforce-mode flycheck-pyflakes pydoc jedi-direx jedi elpy deferred yasnippet w3m use-package md4rd material-theme ivy guide-key ggtags flycheck exec-path-from-shell better-defaults auto-complete)))
 '(tool-bar-mode nil))

;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-breakpoint-fringe-face ((t (:foreground "brightred" :box (:line-width 1 :color "brightred" :style released-button))))))

;;; init.el ends here
