
(global-font-lock-mode t)
(setq inhibit-startup-message t)

;;Save back up file
(setq make-backup-files t)
(setq backup-directory-alist(cons
			     (cons "\\.*$" (expand-file-name "~/.emacs-back"))
			     backup-directory-alist))  
(setq make-backup-files nil)

(add-to-list 'load-path "/Users/Soh/.emacs.d/ess-5.14/elisp")
(setq auto-mode-alist
      (cons (cons "\\.r$" 'R-mode) auto-mode-alist))
(autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t)


(put 'upcase-region 'disabled nil)

(add-to-list 'load-path "/Users/Soh/.emacs.d/")
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
                                     interpreter-mode-alist))


(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(setq skeleton-pair 1)