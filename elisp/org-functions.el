(use-package org
  :config
  (setq org-directory "~/org-files" org-default-notes-file (concat org-directory "/organizer.org"))
  (setq org-log-done 'time)
  (setq org-agenda-files '("~/org-files"))
  (setq org-refile-targets
        '((nil :maxlevel . 3)
          (org-agenda-files :maxlevel . 1)))
  ;; (setq org-capture-templates
  ;;       '(("t" "Todo" entry (file+headline "~/org-files/organizer.org" "To-Refile")
  ;;          "* TODO %?\n CREATED: %T")
  ;;         ("s" "Schedule today" entry (file+headline "~/org-files/organizer.org" "To-Refile")
  ;;          "* TODO %?\n CREATED: %T SCHEDULED: %t")
  ;;         ("j" "Journal" entry (file+datetree "~/org-files/journal.org")
  ;;          "* %?\nEntered on %U\n  %i\n  %a")
  ;;         ("r" "Reading" entry (file+headline "~/org-files/readings.org" "To-Refile")
  ;;          "* UNREAD %?\n Created on %T\n [[%^{url}][%^{description}]]")
  ;;         ("p" "Property" entry (file+headline "~/org-files/organizer.org" "To-Refile")
  ;;          "* %^g %? %(call-interactively #'org-set-property)")))
  (setq org-image-actual-width 500)
  (setq org-link-frame-setup
        '((vm . vm-visit-folder-other-frame)
          (vm-imap . vm-visit-imap-folder-other-frame)
          (gnus . org-gnus-no-new-news)
          (file . find-file)
          (wl . wl-other-frame)))
  (setq org-download-image-org-width 500)
  (setq org-download-image-latex-width 10)
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda)
  ("C-c o" . org-capture))

(use-package org-journal
  :ensure t
  :defer t
  :config
  (setq org-journal-dir "~/org-files/journal/"
        org-journal-date-format "%A, %d %B %Y")
  (org-roam-db-autosync-mode))

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/org-roam"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

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

;; (setq org-agenda-custom-commands
;;       '(("c" "Simple agenda view"
;;          ((tags "PRIORITY=\"A\""
;;                 ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
;;                  (org-agenda-overriding-header "High-priority unfinished tasks:")))
;;           (agenda ""
;;                   ((org-agenda-span 7)

;;                    (org-agenda-files (remove "~/org-files/duckie.org"
;;                                              (file-expand-wildcards (concat (file-name-as-directory (format "%s" (nth 0 org-agenda-files))) "*"))))))
;;           (alltodo ""
;;                    ((org-agenda-skip-function
;;                      '(or (my/org-skip-subtree-if-priority ?A)
;;                           (my/org-skip-subtree-if-tag "@literature")
;;                           (org-agenda-skip-if nil '(scheduled deadline))))
;;                     (org-agenda-overriding-header "ALL normal priority tasks:")))
;;           (agenda ""
;;                   ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
;;                    (org-agenda-files '("~/org-files/duckie.org"))
;;                    (org-agenda-span 'year)
;;                    (org-agenda-show-all-dates nil)
;;                    (org-agenda-overriding-header "Duck and Cat:")))
;;           (todo ""
;;                 ((org-agenda-files '("~/org-files/readings.org"))
;;                  (org-agenda-overriding-header "Reading list:"))))
;;          ((org-agenda-compact-blocks nil)))))

(use-package org-download
  :after org
  :bind
  (:map org-mode-map
        (("s-Y" . org-download-screenshot)
         ("s-y" . org-download-yank)
         ("C-s-v" . org-download-clipboard))))

(defun my/org-skip-subtree-if-priority (priority)
  "Skip an agenda subtree if it has a priority of PRIORITY.

   PRIORITY may be one of the characters ?A, ?B, or ?C."
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (pri-value (* 1000 (- org-lowest-priority priority)))
        (pri-current (org-get-priority (thing-at-point 'line t))))
    (if (= pri-value pri-current)
        subtree-end
      nil)))

(defun my/org-skip-subtree-if-tag (tag)
  "Skip an agenda subtree if it has the tag TAG"
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (file-tags (org-get-tags)))
    (if (member tag file-tags)
        subtree-end
      nil)))

(use-package org-tree-slide
  :diminish (org-tree-slide-mode)
  :custom
  (org-image-actual-width nil))

(provide 'org-functions)
