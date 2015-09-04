;;;;;;;;;;;;;;;;;;;
;; auto-complete ;;
;;;;;;;;;;;;;;;;;;;
(require 'auto-complete)
(require 'auto-complete-config)
;; ;; (ac-config-default)
;; ;; (add-to-list 'ac-modes 'ess-mode)

;;;;;;;;;
;; ess ;;
;;;;;;;;;
(require 'ess-site)
(defun my-ess-hook ()
  (company-mode -1)
  (auto-complete-mode 1)
  (set-face-attribute 'popup-tip-face    nil   :background "#FFF68F" :foreground "black"))
(add-hook 'ess-mode-hook 'my-ess-hook)
(add-hook 'inferior-ess-mode-hook 'my-ess-hook)


(provide 'setup-r)
