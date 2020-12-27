(use-package spacemacs-theme
  :defer t
  :diminish
  :init
  (load-theme 'spacemacs-dark t))

(defun disable-all-themes ()
  "disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))

(provide 'base-theme)
