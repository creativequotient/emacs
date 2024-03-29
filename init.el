;;; package --- Main init file
;;; Commentary:
;;; This is my init file

;;; Code:

(add-to-list 'load-path (concat user-emacs-directory "elisp"))

(require 'base)
(require 'base-theme)
(require 'base-extensions)
(require 'base-functions)
(require 'base-global-keys)
(require 'org-functions)
(require 'lang-python)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(with-eval-after-load 'tramp
  (add-to-list 'tramp-methods
               '("sshx11"
                 (tramp-login-program        "ssh")
                 (tramp-login-args           (("-l" "%u") ("-p" "%p") ("%c")
                                              ("-e" "none") ("-X") ("%h")))
                 (tramp-async-args           (("-q")))
                 (tramp-remote-shell         "/bin/sh")
                 (tramp-remote-shell-login   ("-l"))
                 (tramp-remote-shell-args    ("-c"))
                 (tramp-gw-args              (("-o" "GlobalKnownHostsFile=/dev/null")
                                              ("-o" "UserKnownHostsFile=/dev/null")
                                              ("-o" "StrictHostKeyChecking=no")
                                              ("-o" "ForwardX11=yes")))
                 (tramp-default-port         22)))
  (tramp-set-completion-function "sshx11" tramp-completion-function-alist-ssh))

(setq browse-url-new-window-flag nil)
(setq browse-url-mozilla-new-window-is-tab nil)
(setq browse-url-firefox-new-window-is-tab nil)

;;; Use spaces for automatic indentation
(setq-default indent-tabs-mode nil)
(put 'downcase-region 'disabled nil)
