;;; package --- python configs
;;; Commentary:
;;; Contains my python configs

;;; Code:

(use-package python)

(use-package pip-requirements
  :config
  (add-hook 'pip-requirements-mode-hook #'pip-requirements-auto-complete-setup))

;; (use-package py-autopep8)

;; (use-package pyvenv
;;   :config
;;   (if (string-equal system-type "gnu/linux")
;;               (setenv "WORKON_HOME" "/home/minerva/anaconda3/envs")
;;             (setenv "WORKON_HOME" "/Users/omelettes/opt/anaconda3/envs"))
;;   (pyvenv-workon "blockchain"))

(use-package lsp-mode
  :hook
  (python-mode . lsp-deferred)
  (js-mode . lsp-deferred)
  :commands (lsp lsp-deferred))

(provide 'lang-python)
;;; base-python.el ends here
