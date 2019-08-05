(setq c-default-style "bsd"
      c-basic-offset 8
      tab-width 8
      indent-tabs-mode t)
(require 'whitespace)
(setq whitespace-style '(face empty lines-tail trailing))
(global-whitespace-mode t)
(setq column-number-mode t)
; start package.el with emacs
(require 'package)
; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
; initialize package.el
(package-initialize)
					; start auto-complete with emacs
(require 'auto-complete)
					; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
					; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include")
  )
; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

; Fix iedit bug in Mac
(define-key global-map (kbd "C-c ;") 'iedit-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("a77ced882e25028e994d168a612c763a4feb8c4ab67c5ff48688654d0264370c" "83618eb590691e4c9efc9f9298cf2f1749be1cbcd914401b0d31f783d23c5cec" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "b4b0661b4f6208ed091c38c2825e4fcff8e9743e64ed1bc759fc75564219aa77" default)))
 '(package-selected-packages
   (quote
    (puppet-mode web-mode multiple-cursors markdown-mode bf-mode flycheck-color-mode-line which-key flycheck-pycheckers ace-window helm use-package spacemacs-theme exec-path-from-shell py-autopep8 projectile rainbow-delimiters highlight-indent-guides highlight-indentation pylint magit undo-tree dracula-theme zenburn-theme soothe-theme aggressive-indent clean-aindent-mode indent-guide smartparens yasnippet irony iedit flycheck counsel auto-complete-c-headers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

					;smartparens
(require 'smartparens-config)
(add-hook 'c-mode-hook #'smartparens-mode)
(add-hook 'python-mode-hook #'smartparens-mode)

					;indent guide
(require 'indent-guide)
;(indent-guide-global-mode)
(add-hook 'python-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'column)

					;aggressive indent-guide
(global-aggressive-indent-mode 1)

					;globl undo tree mode
(global-undo-tree-mode)

					;make ctrl-z undo
(global-set-key (kbd "C-z") 'undo)

					;make ctrl-Z redo
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-S-z") 'redo)

(global-flycheck-mode)
(put 'downcase-region 'disabled nil) ;C-x l
(put 'upcase-region 'disabled nil)   ;C-x u

					;always show line numbers
(global-linum-mode 1)
(setq linum-format "%3d\u2502 ")

(with-eval-after-load 'smartparens
  (sp-with-modes
      '(c++-mode objc-mode c-mode)
    (sp-local-pair "{" nil :post-handlers '(:add ("||\n[i]" "RET")))))

					; Turn on mouse
(xterm-mouse-mode 1)

					; Deletes selected area when paste other thing
(delete-selection-mode)

;;;(global-set-key (kbd "<mouse-3>") 'clipboard-yank)

					; Rainbow delimeters
(add-hook 'python-mode-hook #'rainbow-delimiters-mode) ; rainbow delimeters in python
;;; Projectile
;;; (projectile-mode +1)
;; (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; (when (memq window-system '(mac ns x))
;;   (exec-path-from-shell-initialize))

;; ;; This is only needed once, near the top of the file
;; (eval-when-compile
;;   ;; Following line is not needed if use-package.el is in ~/.emacs.d
;;   (add-to-list 'load-path "/home/vagrant/.emacs.d/elpa/use-package-20190405.2047")
;;   (require 'use-package))


					; Set python interpretor to v3
(setq python-shell-interpreter "python3"
      python-shell-interpreter-args "-i")

					; Set path  to pylint
(setq flycheck-python-pylint-executable "/usr/local/bin/pylint")
;; (add-hook 'python-mode-hook
;; 	  (lambda ()
;; 	    (setq flycheck-python-pylint-executable "/usr/local/bin/pylint")
;; 	    (setq flycheck-pylintrc "/home/vagrant/pylintrc")

					; Shows closing and opening parenthesis
(show-paren-mode 1)

;; (setq flycheck-highlighting-mode 'lines)
;; (setq flycheck-indication-mode 'left-fringe)

					; Turn on flycheck
(global-flycheck-mode 1)

					; Pycheckers
;; (with-eval-after-load 'flycheck
;;   (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup))

					; Shows key indings
(which-key-mode)
(which-key-setup-minibuffer)

;; (require 'flycheck-color-mode-line)
;; (eval-after-load "flycheck"
;;   '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

					; Multiple cursors
(require 'multiple-cursors) ;;; multiple cursors
(global-set-key (kbd "C-c m c") 'mc/edit-lines)

					; Helm Config
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)

					; Web Mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;;; init.el ends here
