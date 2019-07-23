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

(use-package ess
  :ensure t
  :config
  (setq ess-eval-visibly 'nowait))

(provide 'base-functions)
