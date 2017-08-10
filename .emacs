;; No startup message!
(setq inhibit-startup-message t)

;; Stupid emacs is stupid
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(setq make-backup-files nil)

(setq tab-width 2)
(setq indent-tabs-mode nil)
(setq visible-bell nil)

(require 'ido)
(ido-mode t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(dolist (p '(clojure-mode
             cider
             paredit
             magit
             js2-mode))
  (unless (package-installed-p p)
    (package-install p)))

(require 'dired)
(require 'magit)
(require 'ediff)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-lein-command "/usr/local/bin/lein")
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(indent-tabs-mode nil)
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 '(tab-width 2))

(add-hook 'clojure-mode-hook 'paredit-mode)

;; Custom key bindings
(global-set-key "\C-x\C-c" 'ignore)
(global-set-key "\C-x\C-q" 'kill-emacs)

;; Global keys to operate with modes
(global-set-key "\C-xg" 'magit-status)

;; ediff
(setq ;;diff-switches “-u”
      ediff-window-setup-function ‘ediff-setup-windows-plain)

;; Run the emacs in-process server to accept remote-edit requests
(server-start)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
