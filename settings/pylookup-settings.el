;;; pylookup-settings -- Settings for pylookup
;;;
;;; Commentary:

;;; Code:

(setq home (getenv "HOME"))
(setq pylookup-dir (concat home "/.emacs.d/pylookup"))
(add-to-list 'load-path pylookup-dir)

(load-file (concat pylookup-dir "/pylookup.el"))

;; set executable file and db file
(setq pylookup-program (concat pylookup-dir "/pylookup.py"))
(setq pylookup-db-file (concat pylookup-dir "/pylookup3.db"))

(delq 'home nil)
(delq 'pylookup-dir nil)

;; set search option if you want
;; (setq pylookup-search-options '("--insensitive" "0" "--desc" "0"))

;; to speedup, just load it on demand
(autoload 'pylookup-lookup "pylookup"
  "Lookup SEARCH-TERM in the Python HTML indexes." t)

(autoload 'pylookup-update "pylookup"
  "Run pylookup-update and create the database at `pylookup-db-file'." t)

(provide 'pylookup-settings)
;;; pylookup-settings.el ends here
