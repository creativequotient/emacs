(use-package dired-x
  :ensure nil
  :init
  (setq dired-omit-files "^\\...+$")
  (add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))
  (setq dired-listing-switches "-alh"))

(use-package electric
  :ensure t
  :init
  (progn (electric-pair-mode 1))
  :config
  (setq-default electric-indent-inhibit t))

(use-package rainbow-mode
  :init
  (add-hook 'prog-mode-hook 'rainbow-mode)
  :config
  (rainbow-mode t))

;; (use-package pdf-tools
;;   :ensure t
;;   :config
;;   (pdf-tools-install)
;;   (setq-default pdf-view-display-size 'fit-page)
;;   (bind-keys :map pdf-view-mode-map
;;              ("\\" . hydra-pdftools/body)
;;              ("<s-spc>" .  pdf-view-scroll-down-or-next-page)
;;              ("g"  . pdf-view-first-page)
;;              ("G"  . pdf-view-last-page)
;;              ("l"  . image-forward-hscroll)
;;              ("h"  . image-backward-hscroll)
;;              ("j"  . pdf-view-next-page)
;;              ("k"  . pdf-view-previous-page)
;;              ("e"  . pdf-view-goto-page)
;;              ("u"  . pdf-view-revert-buffer)
;;              ("al" . pdf-annot-list-annotations)
;;              ("ad" . pdf-annot-delete)
;;              ("aa" . pdf-annot-attachment-dired)
;;              ("am" . pdf-annot-add-markup-annotation)
;;              ("at" . pdf-annot-add-text-annotation)
;;              ("y"  . pdf-view-kill-ring-save)
;;              ("i"  . pdf-misc-display-metadata)
;;              ("s"  . pdf-occur)
;;              ("b"  . pdf-view-set-slice-from-bounding-box)
;;              ("r"  . pdf-view-reset-slice)))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 30))

(provide 'base-functions)
