(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(global-semantic-stickyfunc-mode 1)

(semantic-mode 1)

(semantic-add-system-include "/usr/include/boost" 'c++-mode)
(semantic-add-system-include "/usr/include/c++/5.1.1/x86_64-redhat-linux/")
(semantic-add-system-include "/usr/include/c++/5.1.1/backward/")
(semantic-add-system-include "/usr/include/c++/5.1.1/")
(semantic-add-system-include "/usr/lib/gcc/x86_64-redhat-linux/5.1.1/include")
(semantic-add-system-include "~/linux/kernel")
(semantic-add-system-include "~/linux/include")

(defun alexott/cedet-hook ()
  (local-set-key "\C-c\C-j" 'semantic-ia-fast-jump)
  (local-set-key "\C-c\C-s" 'semantic-ia-show-summary))

(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'c-mode-hook 'alexott/cedet-hook)
(add-hook 'c++-mode-hook 'alexott/cedet-hook)

;; Enable EDE only in C/C++
(require 'ede)
(global-ede-mode)

(provide 'setup-cedet)
