;; Add your keys here, as such

;(global-set-key (kbd "[SHORTCUT]") '[FUNCTION])

(global-set-key (kbd "C-;") 'avy-goto-char)
(global-set-key (kbd "C-:") 'avy-goto-char-2)
(define-key flyspell-mode-map (kbd "C-;") 'helm-flyspell-correct)
(provide 'base-global-keys)
