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
;; (auto-compile auto-complete auto-complete-c-headers auto-complete-clang color-theme dash faceup function-args geiser google-c-style helm helm-gtags helm-swoop indent-guide ipython js2-mode julia-mode markdown-mode web-mode emmet-mode nyan-mode packed paredit paredit-menu pep8 popup pyflakes pylint pymacs python-mode python-pep8 quack racket-mode rainbow-delimiters rainbow-mode smartparens solarized-theme sql-indent sr-speedbar swiper yasnippet multi-term)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; set CEDET
(load-file (concat user-emacs-directory "~/.emacs.d/cedet/cedet-devel-load.el"))
(load-file (concat user-emacs-directory "~/.emacs.d/cedet/contrib/cedet-contrib-load.el"))


;; set custom folder path
(add-to-list 'load-path "~/.emacs.d/custom")


(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

(require 'setup-helm)
(require 'setup-helm-gtags)
(require 'setup-cedet)
(require 'setup-editing)

(windmove-default-keybindings)

;;;;;;;;;;;;;;;;;;;
;; function-args ;;
;;;;;;;;;;;;;;;;;;;
(require 'function-args)
(fa-config-default)
(define-key c-mode-map  [(tab)] 'company-complete)
(define-key c++-mode-map  [(tab)] 'company-complete)

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
;; (add-to-list 'company-c-headers-path-system "/usr/include/c++/5.1.1/")

(setq
 c-default-style "linux" ;; set style to "linux"
 )

(global-set-key (kbd "RET") 'newline-and-indent)  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

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

;; Package: clean-aindent-mode
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; Package: dtrt-indent
(require 'dtrt-indent)
(dtrt-indent-mode 1)

;; Package: ws-butler
(require 'ws-butler)
(add-hook 'prog-mode-hook 'ws-butler-mode)

;smartparens
;;;;;;;;;;;;;;;;;;;;;
(require 'smartparens-config)
(setq sp-base-key-bindings 'paredit)
(setq sp-autoskip-closing-pair 'always)
(setq sp-hybrid-kill-entire-symbol nil)
(sp-use-paredit-bindings)
(show-smartparens-global-mode t)
(smartparens-global-mode t)
(add-hook 'inferior-ess-mode-hook 'show-smartparens-mode)
(add-hook 'inferior-ess-mode-hook 'smartparens-mode)

;; Package: projejctile
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)

(require 'helm-projectile)
(helm-projectile-on)
(setq projectile-completion-system 'helm)
(setq projectile-indexing-method 'alien)

;; Package zygospore
(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)

;;;;;;;;;;;;;;
;rainbow-delimiters
;;;;;;;;;;;;;;
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'ess-mode-hook #'rainbow-delimiters-mode)

;;;;;;;;;;;;;;;;;;;;;
;rainbow mode CSS
;;;;;;;;;;;;;;;;;;;;;
(require 'rainbow-mode)
(dolist (hook '(markdown-mode-hook css-mode-hook html-mode-hook sass-mode-hook ess-mode-hook inferior-ess-mode-hook))
  (add-hook hook 'rainbow-turn-on))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ; auto-complete
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'auto-complete)
;; (require 'auto-complete-config)
;; (ac-config-default)

;; ;;;;;;;;;
;; ;; ess ;;
;; ;;;;;;;;;
;; (require 'ess-site)
;; (set-face-attribute 'popup-tip-face    nil   :background "#FFF68F" :foreground "black")


;;;;;;;;;;;;;;;;;;
;; indent-guide
;;;;;;;;;;;;;;;;;;
(require 'indent-guide)
(set-face-background 'indent-guide-face "gray")
(add-hook 'prog-mode-hook 'indent-guide-mode)
(add-hook 'ess-mode-hook 'indent-guide-mode)
(add-hook 'markdown-mode-hook 'indent-guide-mode)

;;;;;;;;;;;;;;;;;;
;google-c-style
;;;;;;;;;;;;;;;;;;
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;;;;;;;;;;;;;;;;;;;;;;;;
;open hs-mode
;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'ess-mode-hook 'hs-minor-mode)

;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;
;open linum mode
;;;;;;;;;;;;;;;;;;;;;;;;;
(setq linum-format "%4d \u2502")
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'ess-mode-hook 'linum-mode)
(add-hook 'markdown-mode-hook 'linum-mode)

;;;;;;;;;;;;;;;;;;;;;;;;
;use ido mode
;;;;;;;;;;;;;;;;;;;;;;;;
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;use ibuffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;nyan-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;
(nyan-mode t)

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
    ("/usr/include/" "/usr/local/include/" "/usr/include/c++/5.1.1/" "/usr/include/c++/5.1.1/x86_64-redhat-linux/" "/usr/include/c++/5.1.1/backward/")))
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

;;;;;;;;;;;;;;
;emmet-mode
;;;;;;;;;;;;;
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)


;;;;;;;;;;;;;;
;web-mode
;;;;;;;;;;;;;;;
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; markdown
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; ;;;;;;;;;;;;;;;;;
;; ;auctex
;; ;;;;;;;;;;;;;;;;;
;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)
;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (setq-default TeX-master nil)
;; (mapc (lambda (mode)
;; 	(add-hook 'LaTeX-mode-hook mode))
;;       (list 'auto-complete-mode
;; 	    'auto-fill-mode
;; 	    'LaTeX-math-mode
;; 	    'turn-on-reftex
;; 	    'linum-mode))
;; (add-hook 'LaTeX-mode-hook
;;           (lambda ()
;;             (setq TeX-auto-untabify t     ; remove all tabs before saving
;;                   TeX-engine 'xetex       ; use xelatex default
;;                   TeX-show-compilation t) ; display compilation windows
;;             (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
;;             (setq TeX-save-query nil)
;;             (imenu-add-menubar-index)
;;             (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)))
;; ; set pdf view tool
;; (setq TeX-view-program-list '(("Evince" "evince %o")))
;; (cond
;;  ((eq system-type 'windows-nt)
;;   (add-hook 'LaTeX-mode-hook
;;             (lambda ()
;;               (setq TeX-view-program-selection '((output-pdf "SumatraPDF")
;;                                                  (output-dvi "Yap"))))))

;;  ((eq system-type 'gnu/linux)
;;   (add-hook 'LaTeX-mode-hook
;;             (lambda ()
;;               (setq TeX-view-program-selection '((output-pdf "Evince")
;;                                                  (output-dvi "Evince")))))))
;; ; XeLaTeX
;; (add-hook 'LaTeX-mode-hook (lambda()
;; 			     (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
;; 			     (setq TeX-command-default "XeLaTeX")
;; 			     (setq TeX-save-query  nil )
;; 			     (setq TeX-show-compilation t)
;; 			     ))



;;;;;;;;;;;;;;;;;
;js2
;;;;;;;;;;;;;;;;;
(require 'js2-mode)
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))



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

;;;;;;;;;;;;
;; Scheme
;;;;;;;;;;;;
(require 'cmuscheme)
(setq scheme-program-name "petite")         ;; 如果用 Petite 就改成 "petite"


;; bypass the interactive question and start the default interpreter
(defun scheme-proc ()
  "Return the current Scheme process, starting one if necessary."
  (unless (and scheme-buffer
               (get-buffer scheme-buffer)
               (comint-check-proc scheme-buffer))
    (save-window-excursion
      (run-scheme scheme-program-name)))
  (or (scheme-get-process)
      (error "No current process. See variable `scheme-buffer'")))


(defun scheme-split-window ()
  (cond
   ((= 1 (count-windows))
    (delete-other-windows)
    (split-window-vertically (floor (* 0.68 (window-height))))
    (other-window 1)
    (switch-to-buffer "*scheme*")
    (other-window 1))
   ((not (find "*scheme*"
               (mapcar (lambda (w) (buffer-name (window-buffer w)))
                       (window-list))
               :test 'equal))
    (other-window 1)
    (switch-to-buffer "*scheme*")
    (other-window -1))))


(defun scheme-send-last-sexp-split-window ()
  (interactive)
  (scheme-split-window)
  (scheme-send-last-sexp))


(defun scheme-send-definition-split-window ()
  (interactive)
  (scheme-split-window)
  (scheme-send-definition))

(add-hook 'scheme-mode-hook
  (lambda ()
    (paredit-mode 1)
    (define-key scheme-mode-map (kbd "<f5>") 'scheme-send-last-sexp-split-window)
    (define-key scheme-mode-map (kbd "<f6>") 'scheme-send-definition-split-window)))




;;;;;;;;;;;;;;;;;;
;Racket mode
;;;;;;;;;;;;;;;;;
(require 'racket-mode)
(add-hook 'racket-mode-hook
  (lambda ()
    (paredit-mode 1)))

(require 'paredit-menu)


;;;;;;;;;;;;;;
;ipython 
;;;;;;;;;;;;;
(defun ipython ()
    (interactive)
    (term "/usr/bin/ipython"))


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
