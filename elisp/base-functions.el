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

(use-package rainbow-mode
  :init
  (add-hook 'prog-mode-hook 'rainbow-mode)
  :config
  (rainbow-mode t) ;; #0af
  )

;; Pretty mode
;; Base set of pretty symbols.
(use-package pretty-symbols
  :init
  (global-prettify-symbols-mode 1)
  :config
  (defvar base-prettify-symbols-alist '(("<=" . ?≤)
                                        (">=" . ?≥)
                                        ;;("<-" . ?←)
                                        ;;("->" . ?→)
                                        ("!=" . ?≠)
                                        ("lambda" . ?λ)
                                        ;;("def"    . ?ƒ)
                                        ;;("sum"    . ?Σ)
                                        ;;("**2"    . ?²)
                                        ;;("**3"    . ?³)
                                        ("None"   . ?∅)
                                        ("null"   . ?∅)
                                        ("in"     . ?∈)
                                        ("not in" . ?∉)
                                        ;;("return" . ?➡)))
  (defun prettify-symbols-hook ()
    "Set pretty symbols for programming modes."
    (setq prettify-symbols-alist
          (append '(("==" . ?≡)
                    ("!=" . ?≠)) base-prettify-symbols-alist)))
  (add-hook 'prog-mode-hook 'prettify-symbols-hook)
  (add-hook 'emacs-lisp-mode-hook 'prettify-symbols-hook)
  (setq prettify-symbols-unprettify-at-point 'right-edge))

(provide 'base-functions)
