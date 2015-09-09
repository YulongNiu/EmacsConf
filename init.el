;; .emacs
;;;;;;;;;;;;;;;;;;;;
;Library repository
;;;;;;;;;;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Installed Package List
;; '(anzu
;;   async
;;   auto-compile
;;   auto-complete
;;   bind-key
;;   clean-aindent-mode
;;   color-theme
;;   comment-dwim-2
;;   company
;;   company-c-headers
;;   company-irony
;;   ctable
;;   dash
;;   diminish
;;   dtrt-indent
;;   duplicate-thing
;;   emmet-mode
;;   epl
;;   ess
;;   ess-R-data-view
;;   faceup
;;   function-args
;;   geiser
;;   ggtags
;;   google-c-style
;;   helm
;;   helm-core
;;   helm-gtags
;;   helm-projectile
;;   helm-swoop
;;   iedit
;;   indent-guide
;;   ipython
;;   irony
;;   js2-mode
;;   julia-mode
;;   markdown-mode
;;   multi-term
;;   nyan-mode
;;   packed
;;   paredit
;;   paredit-menu
;;   pep8
;;   pkg-info
;;   popup
;;   pos-tip
;;   projectile
;;   pyflakes
;;   pylint
;;   pymacs
;;   python-mode
;;   python-pep8
;;   quack
;;   racket-mode
;;   rainbow-delimiters
;;   rainbow-mode
;;   s
;;   smartparens
;;   solarized-theme
;;   sql-indent
;;   sr-speedbar
;;   swiper
;;   undo-tree
;;   use-package
;;   volatile-highlights
;;   web-mode
;;   ws-butler
;;   zygospore
;;   yasnippet)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; set CEDET
(load-file (concat user-emacs-directory "~/.emacs.d/cedet/cedet-devel-load.el"))
(load-file (concat user-emacs-directory "~/.emacs.d/cedet/contrib/cedet-contrib-load.el"))


;; set custom folder path
(add-to-list 'load-path "~/.emacs.d/custom")


(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

(require 'misc)
(require 'setup-helm)
(require 'setup-helm-gtags)
(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-c)
(require 'setup-python)
(require 'setup-web)
(require 'setup-lisp)
(require 'setup-r)

(windmove-default-keybindings)


;;;;;;;;;;;;;
;; company ;;
;;;;;;;;;;;;;
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(delete 'company-semantic company-backends)
(define-key c-mode-map  [(tab)] 'company-complete)
(define-key c++-mode-map  [(tab)] 'company-complete)

;;;;;;;;;;;;;;;;;;;;;;;
;; company-c-headers ;;
;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'company-backends 'company-c-headers)

;; (eval-after-load 'company
;;   '(add-to-list 'company-backends 'company-irony))

;; (require 'irony)
;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'objc-mode-hook 'irony-mode)

;; ;; replace the `completion-at-point' and `complete-symbol' bindings in
;; ;; irony-mode's buffers by irony-mode's function
;; (defun my-irony-mode-hook ()
;;   (define-key irony-mode-map [remap completion-at-point]
;;     'irony-completion-at-point-async)
;;   (define-key irony-mode-map [remap complete-symbol]
;;     'irony-completion-at-point-async))
;; (add-hook 'irony-mode-hook 'my-irony-mode-hook)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;;;;;;;;;;;;;;;;;;;
;; function-args ;;
;;;;;;;;;;;;;;;;;;;
(require 'function-args)
(fa-config-default)
(define-key c-mode-map  [(tab)] 'company-complete)
(define-key c++-mode-map  [(tab)] 'company-complete)





;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; Package: projejctile
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'helm-projectile)
(helm-projectile-on)
(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'alien)






;;;;;;;;;;;;;;;;;;;;;;;;;;
;yasnippet
;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook 'yas-minor-mode)
(add-hook 'ess-mode-hook 'yas-minor-mode)
(add-hook 'markdown-mode-hook 'yas-minor-mode)
(add-hook 'html-mode-hook 'yas-minor-mode)

;; (yas-global-mode 1)
;; (add-hook 'term-mode-hook (lambda()
;;         (setq yas-dont-activate t)))


;;;;;;;;;;;;;;;;;;;;;;;;
;solarized color theme
;;;;;;;;;;;;;;;;;;;;;;;;
(require 'solarized-theme)
(load-theme 'solarized-light t)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-c-headers-path-system
   (quote
    ("/usr/include/" "/usr/local/include/" "/usr/include/c++/5.1.1/" "/usr/include/c++/5.1.1/x86_64-redhat-linux/" "/usr/include/c++/5.1.1/backward/" "/usr/lib/gcc/x86_64-redhat-linux/5.1.1/include")))
 '(ess-roxy-str "##'")
 '(ess-roxy-template-alist
   (quote
    (("description" . ".. content for \\description{} (no empty lines) ..")
     ("details" . ".. content for \\details{} ..")
     ("title" . "")
     ("param" . "")
     ("return" . "")
     ("examples" . "")
     ("author" . "Yulong Niu \\email{niuylscu@@gmail.com}"))))
 '(ess-user-full-name "Yulong Niu")
 '(markdown-command
   "pandoc -f markdown -t html -s --mathjax=/home/Yulong/Biotools/MathJax-2.5-latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML --highlight-style espresso")
 '(nil nil t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 143 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;; (custom-set-variables
;;  ;; uncomment to always end a file with a newline
;;  ;'(require-final-newline t)
;;  ;; uncomment to disable loading of "default.el" at startup
;;  ;'(inhibit-default-init t)
;;  ;; default to unified diffs
;;  '(diff-switches "-u"))


;;;;;;;;;;;;
;aspell
;;;;;;;;;;;
(setq-default ispell-program-name "aspell")




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; markdown
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))



;;;;;;;;;;;;;;;
; octave
;;;;;;;;;;;;;;;
(autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))
(add-hook 'octave-mode-hook
	  (lambda ()
	    (abbrev-mode 1)
	    (auto-fill-mode 1)
	    (if (eq window-system 'x)
		(font-lock-mode 1))))
(add-hook 'inferior-octave-mode-hook ;up and down arrow in the shell
	  (lambda ()
	    (turn-on-font-lock)
	    (define-key inferior-octave-mode-map [up]
	      'comint-previous-input)
	    (define-key inferior-octave-mode-map [down]
	      'comint-next-input)))



;;;;;;;;;;;;;
;sql-indent					;
;;;;;;;;;;;;;;
(eval-after-load "sql"
  '(load-library "sql-indent"))

;;;;;;;;;;;;;;
; multi-term					;
;;;;;;;;;;;;;;
(require 'multi-term)
(setq multi-term-program "/bin/bash")

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)
