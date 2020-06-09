(use-package org
  :config
  (setq org-directory "~/org-files" org-default-notes-file (concat org-directory "/organizer.org"))
  (setq org-log-done 'time)
  (setq org-agenda-files '("~/org-files"))
  (setq org-refile-targets
        '((nil :maxlevel . 3)
          (org-agenda-files :maxlevel . 1)))
  (setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org-files/organizer.org" "Unfiled")
         "* TODO %?\n Created on %T")
        ("s" "Schedule today" entry (file+headline "~/org-files/organizer.org" "Unfiled")
         "* TODO %?\n SCHEDULED: %t")
        ("j" "Journal" entry (file+datetree "~/org-files/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")))
  ;; (setq org-latex-pdf-process
  ;;     '("pdflatex -interaction nonstopmode -output-directory %o %f"
  ;;       "bibtex %b"
  ;;       "pdflatex -interaction nonstopmode -output-directory %o %f"
  ;;       "pdflatex -interaction nonstopmode -output-directory %o %f"))
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda)
  ("C-c o" . org-capture))

;; (use-package org-projectile
;;   :config
;;   (org-projectile-per-project)
;;   (setq org-projectile-per-project-filepath "todo.org"
;; 	org-agenda-files (append org-agenda-files (org-projectile-todo-files))))

(use-package org-bullets
  :config
  (setq org-hide-leading-stars t)
  (add-hook 'org-mode-hook
            (lambda ()
              (org-bullets-mode t))))

(use-package org-ref
  :config
  (setq  org-latex-pdf-process
       '("latexmk -shell-escape -bibtex -pdf %f")))

(provide 'org-functions)
