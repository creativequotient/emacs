(use-package dired-x
  :ensure nil
  :init
  (setq dired-omit-files "^\\...+$")
  (add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))
  (setq dired-listing-switches "-alh"))

(use-package electric
  :ensure t
  :init
  (progn
    (electric-pair-mode 1)))

(provide 'base-functions)
