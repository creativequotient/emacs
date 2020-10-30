(use-package leuven-theme
  :defer t
  :init
  (load-theme 'leuven t))

;; (use-package material-theme
;;   :defer t
;;   :init
;;   (load-theme 'material t))

;; (use-package monokai-pro-theme
;;   :defer t
;;   :init
;;   (load-theme 'monokai-pro t))

;; (use-package parchment-theme
;;   :defer t
;;   :init
;;   (load-theme 'parchment t))

;; (use-package atom-one-dark-theme
;;   :defer t
;;   :init
;;   (load-theme 'atom-one-dark t))

(defun disable-all-themes ()
  "disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))

(provide 'base-theme)
