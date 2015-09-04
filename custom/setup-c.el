;; ;; set style to "linux"
;; (setq c-default-style "linux")

;;;;;;;;;;;;;;;;;;;;
;; google-c-style ;;
;;;;;;;;;;;;;;;;;;;;
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)



(provide 'setup-c)
