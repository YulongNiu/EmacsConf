;; automatically indent when press RET
(global-set-key (kbd "RET") 'newline-and-indent)

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; use ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; hs-mode
(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'ess-mode-hook 'hs-minor-mode)

;; linum mode
(setq linum-format "%4d \u2502")
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'ess-mode-hook 'linum-mode)
(add-hook 'markdown-mode-hook 'linum-mode)

;; ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;;;;;;;;;;;;;;
;; nyan-mode ;;
;;;;;;;;;;;;;;;
(nyan-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;
;; clean-aindent-mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;;;;;;;;;;;;;;;;;
;; dtrt-indent ;;
;;;;;;;;;;;;;;;;;
(require 'dtrt-indent)
(dtrt-indent-mode 1)

;;;;;;;;;;;;;;;
;; ws-butler ;;
;;;;;;;;;;;;;;;
(require 'ws-butler)
(add-hook 'prog-mode-hook 'ws-butler-mode)

;;;;;;;;;;;;;;;;;
;; smartparens ;;
;;;;;;;;;;;;;;;;;
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)
(show-smartparens-global-mode t)
(smartparens-global-mode t)
(add-hook 'inferior-ess-mode-hook 'show-smartparens-mode)
(add-hook 'inferior-ess-mode-hook 'smartparens-mode)

;;;;;;;;;;;;;;;
;; zygospore ;;
;;;;;;;;;;;;;;;
(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)

;;;;;;;;;;;;;;;;;;;;;;;;
;; rainbow-delimiters ;;
;;;;;;;;;;;;;;;;;;;;;;;;
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'ess-mode-hook #'rainbow-delimiters-mode)

;;;;;;;;;;;;;;;;;;
;; indent-guide ;;
;;;;;;;;;;;;;;;;;;
(require 'indent-guide)
(set-face-background 'indent-guide-face "gray")
(add-hook 'prog-mode-hook 'indent-guide-mode)
(add-hook 'ess-mode-hook 'indent-guide-mode)
(add-hook 'markdown-mode-hook 'indent-guide-mode)


(provide 'misc)
