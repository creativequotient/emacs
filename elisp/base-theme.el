(use-package gruvbox-theme
  :defer t
  :init
  (load-theme 'gruvbox-dark-hard t))

(defun disable-all-themes ()
  "disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))

(provide 'base-theme)
