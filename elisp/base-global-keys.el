;; Add your keys here, as such

;;(global-set-key (kbd "[SHORTCUT]") '[FUNCTION])

(global-set-key (kbd "C-;") 'avy-goto-char)
(global-set-key (kbd "C-c y") 'yas-insert-snippet)

(set-register ?o (cons 'file "~/org-files"))
(set-register ?e (cons 'file "~/.emacs.d"))

(provide 'base-global-keys)
