;;; misc-init.el -- Miscellaneous packages
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package markdown-mode
  :ensure t
  :mode (("\\.markdown\\'" . markdown-mode)
         ("\\.md\\'"       . markdown-mode)))

(use-package unicode-fonts
  :ensure t
  :defer t)

(use-package nix-mode
  :ensure t
  :mode "\\.nix\\'")

;; Sweet relative numbering
(use-package linum-relative
  :ensure t
  :config
  (setq linum-relative-backend 'display-line-numbers-mode)
  :bind(("<f4>" . linum-relative-mode)))

(use-package smbc
  :defer 10
  :ensure t)

(use-package switch-window
  :ensure t
  :bind (;; other-window shows a number when switching
         ;; ("M-o"   . switch-window)
         ("M-o"   . other-window)
         ("C-x o" . other-window)))

(use-package rainbow-delimiters
  :ensure t
  :defer 2
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package diminish
  :ensure t
  :config
  (diminish 'auto-revert-mode)
  (diminish 'yas-minor-mode))

(use-package saveplace
  :config (save-place-mode))

;; Indents the file according to current settings
(use-package dtrt-indent
  :ensure t
  :defer 3
  :config
  (setq dtrt-indent-mode 1))

(use-package all-the-icons
  :ensure t)

(use-package multi-term
  :ensure t
  :config
  (setq multi-term-program nil)
  (add-hook 'term-mode-hook
            (lambda ()
              (setq term-buffer-maximum-size 10000)))
  :bind (:map term-raw-map (("C-y" . term-paste)
                            ("M-o" . other-window))))

;; Kill backup files!
(setq make-backup-files nil
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      echo-keystrokes 0.1
      visible-bell t)

(global-eldoc-mode -1)

(use-package exec-path-from-shell
  :ensure t)

(use-package pdf-tools
  :ensure t
  :defer 10)

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :defer t)

(use-package diminish
  :ensure t
  :config
  (diminish 'abbrev-mode))

(use-package treemacs
  :ensure t)

(provide 'misc-init)
;;; misc-init.el ends here
