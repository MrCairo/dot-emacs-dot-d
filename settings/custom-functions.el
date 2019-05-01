;;;----------------------;
;;; Custom Functions   ;;;
;;;;-------------------;;;

; unfill a paragraph, i.e., make it so the text does not wrap in the
; paragraph where the cursor is
(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

; unfill a region, i.e., make is so the text in that region does not
; wrap
(defun unfill-region ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-region (region-beginning) (region-end) nil)))

(defun system-is-mac ()
  (interactive)
  (string-equal system-type "darwin"))

(defun system-is-linux ()
  (interactive)
  (string-equal system-type "gnu/linux"))

(defun make-plugin-path (plugin)
  (expand-file-name
   (concat plugin-path plugin)))

(defun include-plugin (plugin)
  (add-to-list 'load-path (make-plugin-path plugin)))

(defun make-elget-path (plugin)
  (expand-file-name
   (concat elget-path plugin)))

(defun include-elget-plugin (plugin)
  (add-to-list 'load-path (make-elget-path plugin)))

(defun add-to-path (new-path &optional end-of-path)
  "Adds the new path to the existing PATH in the environment.  If
end-of-list is not nil, new-path is appended to the end of the PATH
otherwise it is prepended to the PATH"
  (setq tmp-path (getenv "PATH"))
  (if (not (cl-search new-path tmp-path))
      (if (eq end-of-path t)
          (setenv "PATH" (concat tmp-path (concat ":" new-path)))
        (setenv "PATH" (concat new-path (concat ":" tmp-path))))
    nil)
  (makunbound 'tmp-path))

(provide 'custom-functions)

;;; custom-functions.el ends here
