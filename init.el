(require 'package)
(add-to-list 'package-archives
         '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
;;-----------------------------------------------------
;; material theme
;;-----------------------------------------------------
(unless (package-installed-p 'material-theme)
  (package-install 'material-theme))
(require 'material-theme) ; package must be installed

(load-theme 'material t)
;;-----------------------------------------------------
;; exec-path-from-shell
;(unless (package-installed-p 'exec-path-from-shell)
;  (package-install 'exec-path-from-shell))
;(require 'exec-path-from-shell)
;(when (memq window-system '(mac ns x))
;  (exec-path-from-shell-initialize))
;;-----------------------------------------------------

;; function args
(unless (package-installed-p 'function-args)
  (package-install 'function-args))
(require 'function-args) ; package must be installed
;;-----------------------------------------------------
;; sr-speedbar
(unless (package-installed-p 'sr-speedbar)
  (package-install 'sr-speedbar))
(require 'sr-speedbar)
;;-----------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/custom")
;;-----------------------------------------------------
;; helm
(unless (package-installed-p 'helm)
  (package-install 'helm))
(require 'helm)
(require 'helm-config)
(helm-mode 1)
(helm-autoresize-mode t) ;; auto rize helm buffer
(require 'setup-general)
;;-----------------------------------------------------
;; company mode
(unless (package-installed-p 'company)
  (package-install 'company))
(require 'company) ;; package must be installed
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-c-headers)

;;----------------------------------------------------
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
;; (require 'setup-ggtags)

(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)


(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-c)
(require 'setup-python)
;;-----------------------------------------------------
;; TeX Stuff
(require 'flymake)
(defun flymake-get-tex-args (file-name)
  (list "pdflatex"
        (list "-file-line-error" "-draftmode" "-interaction=nonstopmpode" file-name)))

(add-hook 'LaTex-mode-hook 'flymake-mode)
;; Spell Check
;(setq ispell-program-name "ispell");Other option is apsell
;(setq ispell-dictionary "english")
;(add-hook 'LaTeX-mode-hook 'flyspell-mode)
;(add-hook 'LaTeX-mode-hook 'flyspell-buffer)

;; Outline mode -- hide parts of the file
(defun turn-on-outline-minor-mode ()
  (outline-minro-mode-1) )
(add-hook 'LaTex-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
(setq outline-minor-mode-prefix "\C-c \C-o"); key binding



;;-----------------------------------------------------
;; go lang stuff
;;(unless (package-installed-p 'company-go)
;;  (package-install 'company-go))
;;(require 'company-go) ; package must be installed

;;(unless (package-installed-p 'go-mode)
;;  (package-install 'go-mode))
;;(require 'go-mode) ; package must be installed


;;-----------------------------------------------------


;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;--------------------------------------------------------
;;(global-set-key (kbd "C-x C-b") 'ibuffer)
;; ========== Prevent Emacs from making backup files ==========
(setq make-backup-files nil)
(setq auto-save-default nil) ; stop creating those #auto-save# files
;;---------------------------------------------
;; ========== Enable Line and Column Numbering ==========
;; Show line-number in the mode line
(line-number-mode 1)
(global-linum-mode 1) ; always show line numbers

;; Show column-number in the mode line
;;(column-number-mode 1)

;;(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
;; '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))
(setq indent-tabs-mode nil)


;; // TODO ADD so that we require electric pair mode 
(electric-pair-mode 1)
;; show which parenthesis matches the one I’m looking at
(show-paren-mode 1)
;;  modify the titlebar to contain the current file name
(setq frame-title-format "%b")

;;// Open Links in google chrome
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")
