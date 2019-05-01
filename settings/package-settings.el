;;
;; Load packages if not already loaded.
;; --------------------------------------

(require 'package)
(require 'cl-lib)
(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(when (not package-archive-contents)
 (package-refresh-contents))

(defvar myPackages
  '(
    auto-complete
    better-defaults
    cyberpunk-theme
    doom-themes
    exec-path-from-shell
    flycheck
    ivy
    magit
    material-theme
    moe-theme
    org
    yasnippet
    ))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

(provide 'package-settings)
