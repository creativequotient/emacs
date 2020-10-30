;; Add your keys here, as such

;(global-set-key (kbd "[SHORTCUT]") '[FUNCTION])

(global-set-key (kbd "C-;") 'avy-goto-char)
(global-set-key (kbd "C-c y") 'yas-insert-snippet)

(define-key flyspell-mode-map (kbd "C-:") 'helm-flyspell-correct)

(set-register ?o (cons 'file "~/org-files"))
(set-register ?s (cons 'file "~/org-files/school.org"))
(set-register ?e (cons 'file "~/.emacs.d"))
(set-register ?j (cons 'file "~/work/scratch"))
(set-register ?m (cons 'file "~/Projects/multiagentrl"))
(set-register ?M (cons 'file "~/Dropbox/MARL"))

(provide 'base-global-keys)
