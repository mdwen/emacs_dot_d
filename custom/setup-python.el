;; Python

;; Make sure following are installed
;; pip install rope jedi flake8 importmagic autopep8 yapf
;;
(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")
(unless (package-installed-p 'python-mode)
  (package-install 'python-mode))
;(require 'python-mode)

(unless (package-installed-p 'elpy)
  (package-install 'elpy))
(require 'elpy)
(elpy-enable)
(provide 'setup-python)
