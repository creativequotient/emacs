(defun my-org-agenda-skip-all-siblings-but-first ()
  "Skip all but the first non-done entry."
  (let (should-skip-entry)
    (unless (org-current-is-todo)
      (setq should-skip-entry t))
    (save-excursion
      (while (and (not should-skip-entry) (org-goto-sibling t))
        (when (org-current-is-todo)
          (setq should-skip-entry t))))
    (when should-skip-entry
      (or (outline-next-heading)
          (goto-char (point-max))))))

(defun org-current-is-todo ()
  (string= "TODO" (org-get-todo-state)))

(use-package org
  :pin gnu
  :config
  (setq org-directory "~/Documents/org" org-default-notes-file (concat org-directory "/organizer.org"))
  (setq org-log-done 'time)
  (setq org-agenda-files '("~/Documents/org/inbox.org"
                           "~/Documents/org/gtd.org"
                           "~/Documents/org/research.org"))
  (setq org-agenda-custom-commands
        '(("c" "Simple agenda view"
           ((agenda ""
                    ((org-agenda-span 7)
                     ))
            (alltodo ""
                     ((org-agenda-files (remove "~/Documents/org/research.org" org-agenda-files))
                      (org-agenda-skip-function
                       '(or (my/org-skip-subtree-if-priority ?A)
                            (my/org-skip-subtree-if-tag "@literature")
                            (org-agenda-skip-if nil '(scheduled deadline))))
                      (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)
                      (org-agenda-overriding-header "Projects:")))
            (alltodo ""
                     ((org-agenda-overriding-header "Research Topics")
                      (org-agenda-files '("~/Documents/org/research.org"))
                      (org-agenda-sorting-strategy '(deadline-up priority-down tag-up)))))
           ((org-agenda-compact-blocks nil)))
          ("o" "At the office" tags-todo "@office"
           ((org-agenda-overriding-header "Office")
            (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))
          ))
  (setq org-refile-targets
        '((nil :maxlevel . 3)
          (org-agenda-files :maxlevel . 1)))
  (setq org-capture-templates '(("t" "Todo [inbox]" entry
                                 (file+headline "~/Documents/org/inbox.org" "Tasks")
                                 "* TODO %i%?")
                                ("T" "Tickler" entry
                                 (file+headline "~/Documents/org/tickler.org" "Tickler")
                                 "* %i%? \n %U")))
  (setq org-image-actual-width 500)
  (setq org-link-frame-setup
        '((vm . vm-visit-folder-other-frame)
          (vm-imap . vm-visit-imap-folder-other-frame)
          (gnus . org-gnus-no-new-news)
          (file . find-file)
          (wl . wl-other-frame)))
  (setq org-download-image-org-width 500)
  (setq org-download-image-latex-width 10)
  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)
  :bind
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda)
  ("C-c o" . org-capture))

(use-package org-roam
  :ensure t
  :custom (org-roam-directory (file-truename "~/Documents/org-roam"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today)
         ("C-c n t" . org-roam-dailies-goto-today))
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
  :ensure t
  :config
  (setq  org-latex-pdf-process
         '("latexmk -shell-escape -bibtex -pdf %f")))

(use-package org-download
  :after org
  :bind
  (:map org-mode-map
        (("s-Y" . org-download-screenshot)
         ("s-y" . org-download-yank)
         ("C-s-v" . org-download-clipboard))))

(use-package org-cliplink
  :ensure t
  :bind (("C-c l" . org-cliplink)))

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
