;--------------------------------;
;;; General or Global Settings ;;;
;--------------------------------;

;;; Code:
(require 'paren)

; set PATH, because we don't load .bashrc
; function from https://gist.github.com/jakemcc/3887459
(defun set-exec-path-from-shell-PATH ()
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo -n $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(if window-system (set-exec-path-from-shell-PATH))

(setq inhibit-startup-message t) ;; hide the startup message
;;(global-linum-mode t) ;; enable line numbers globally
;;(setq linum-format "%4d | ")

; show the current line and column numbers in the stats bar as well
(line-number-mode 1)
(column-number-mode 1)
;;(global-git-commit-mode t)
;;(display-line-numbers-width 3)
(setq case-fold-search t)

;;(global-font-lock-mode t nil (font-lock))

; highlight parentheses when the cursor is next to them
(show-paren-mode 1)

; disable backup
(setq backup-inhibited t)
; disable auto save
(setq auto-save-default nil)

; set command key to be meta instead of option
(if (system-is-mac)
    (setq ns-command-modifier 'meta))

; number of characters until the fill column
(setq-default fill-column 75)

; each line of text gets one line on the screen (i.e., text will run
; off the left instead of wrapping around onto a new line)
(setq-default truncate-lines 1)
; truncate lines even in partial-width windows
(setq truncate-partial-width-windows 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(current-language-environment "Latin-1")
 '(default-input-method "latin-1-prefix")
 '(global-font-lock-mode t nil (font-lock)))

(global-set-key (kbd "C-c /") 'comment-region)
(global-set-key (kbd "C-c \\") 'uncomment-region)
(global-set-key (kbd "C-c ]") 'indent-region)
(global-set-key (kbd "C-c }") 'indent-region)

; default window width and height
(defun custom-set-frame-size ()
  """Sets the window frame to a size og 150x60"""
  (add-to-list 'default-frame-alist '(height . 60))
  (add-to-list 'default-frame-alist '(width . 150)))
(custom-set-frame-size)
(add-hook 'before-make-frame-hook 'custom-set-frame-size)

(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil)

(provide 'general-settings)

;;; general-settings.el ends here
