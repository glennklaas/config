(package-initialize)

; Only the cool kids use melpa
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

;; Get hints on M-x command line
;;;; (global-set-key (kbd "M-x") 'smex)
;;;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
;;;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; Turn on 
;;;; (ido-mode 1)

;; MacOS Customization
(setq mac-command-modifier 'meta)
(setq global-linum-mode t)
(setq linum-format "%4d \u2502 ")

(setq inhibit-startup-screen t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(pyvenv-mode 1)

;; basic org shortcuts
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-agenda-custom-commands
      '(
	("g" "GTD view"
	 ((agenda)
	  (todo "NEXT" ((org-agenda-overriding-header "Next actions:")))
	  (todo "WAITING" ((org-agenda-overriding-header "Waiting on:")))
	  (todo "DONE" ((org-agenda-overriding-header "Completed items:")))
	  (tags "PROJECTS" ((org-agenda-overriding-header "Projects in progress:")))
	  ))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("bddf21b7face8adffc42c32a8223c3cc83b5c1bbd4ce49a5743ce528ca4da2b6" default))
 '(package-selected-packages
   '(gruber-darker-theme smex conda elpy lsp-pyright use-package))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Menlo" :foundry "nil" :slant normal :weight regular :height 240 :width normal)))))
