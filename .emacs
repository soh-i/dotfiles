;; load path
(setq load-path (append (list (expand-file-name "~/.emacs.d/")) load-path))
(setq load-path (append (list (expand-file-name "~/.emacs.d/auto-complete-1.3.1")) load-path))
(setq load-path (append (list (expand-file-name "~/.emacs.d/ess-12.09/lisp")) load-path))

;; auto-complete
;(require 'auto-complete)
;(require 'auto-complete-config) 
;(global-auto-complete-mode t)
;(setq ac-auto-start nil)
;(ac-set-trigger-key "TAB")

(require 'ess-site)
(setq auto-mode-alist
      (cons (cons "\\.r$" 'R-mode) auto-mode-alist))
(autoload 'R-mode "ess-site" "Emacs Speaks Statistics mode" t)

;; wb-line-number
;(require 'wb-line-number)
;(setq truncate-partial-width-windows nil)
;(set-scroll-bar-mode nil)
;(setq wb-line-number-scroll-bar nil)
;(wb-line-number-toggle )

(custom-set-faces
 '(wb-line-number-face ((t (:foreground "Bold"))))
 '(wb-line-number-scroll-bar-face
   ((t (:foreground "gray" :background "LightBlue2")))))

;; yaml-mode
(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;(require 'linum)
;(global-linum-mode)
;(setq linum-format "%5d")

(global-font-lock-mode t)
(setq inhibit-startup-message t)

;tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(line-number-mode 1)
(column-number-mode 1)

;; Save back up file
(setq make-backup-files t)
(setq backup-directory-alist(cons
                             (cons "\\.*$" (expand-file-name "~/.emacs-back"))
                             backup-directory-alist))  
(setq make-backup-files nil)
(put 'upcase-region 'disabled nil)

(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)

;; perltidy
(defun perltidy-region ()
  "Run perltidy on the current region."
  (interactive)
  (save-excursion 
    (shell-command-on-region (point) (mark)"perltidy -q" nil t)))
(defun perltidy-defun()
  "Run perltidy on the current defun."
  (interactive)
  (save-excursion (mark-defun)
                  (perltidy-region)))

;; Markdown mode
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))


;; cperl-mode
(defalias 'perl-mode 'cperl-mode)
(setq auto-mode-alist (cons '("\\.t$" . cperl-mode) auto-mode-alist))
(add-hook 'cperl-mode-hook
          '(lambda ()
             (cperl-set-style "PerlStyle")))
(setq cperl-highlight-variables-indiscriminately t)
(add-hook 'cperl-mode-hook
          '(lambda ()
             (font-lock-mode 1)
             
             (set-face-underline-p 'underline nil)
             
             (set-face-foreground 'cperl-array-face "blue")
             (set-face-background 'cperl-array-face "nil")
             
             (set-face-foreground 'cperl-hash-face "yellow")
             (set-face-background 'cperl-hash-face "nil")
             
             (set-face-foreground 'font-lock-function-name-face "magenta")
             (set-face-foreground 'font-lock-comment-face "red")
             (set-face-foreground 'font-lock-string-face "white")
             
))

;; Show ()
(show-paren-mode 1)

;; Menu bar off
(if window-system (menu-bar-mode 1) (menu-bar-mode -1))

;; Title bar
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))

;; mode line
(set-face-foreground 'modeline "Foreground") ;; mode-menu color
(set-face-background 'modeline "Bold") ;; word color

(set-face-background 'region "blue")

;; Display time on mode-line
(setq display-time-string-forms
  '((substring year -2) "/" month "/" day " " dayname " " 24-hours ":" minutes))
(display-time)

;;jump to line
;(global-set-key "C-x:" 'goto-line)
