(setq load-path (append (list (expand-file-name "~/.emacs.d/")) load-path))
(setq load-path (append (list (expand-file-name "~/.emacs.d/auto-complete-1.3.1")) load-path))
(setq load-path (append (list (expand-file-name "~/.emacs.d/ess-12.09/lisp")) load-path))

;; auto-complete
;(require 'auto-complete)
;(require 'auto-complete-config)
;(global-auto-complete-mode t)
;(setq ac-auto-start nil)
;(ac-set-trigger-key "TAB")
(require 'popwin)
(popwin-mode 1)

(require 'tabbar)
(tabbar-mode 1)
(global-set-key "\M-]" 'tabbar-forward)  ; Next tab
(global-set-key "\M-[" 'tabbar-backward) ; Previous tab
(setq tabbar-buffer-groups-function nil)
(setq tabbar-separator '(1.0))

(set-face-attribute ; bar colour
  'tabbar-default nil
   :background "white"
   :family "Inconsolata"
   :height 1.0)
(set-face-attribute ; Active tab
  'tabbar-selected nil
  :foreground "red"
  :weight 'bold
  :box nil)
(set-face-attribute ; Inactive tab
  'tabbar-unselected nil
  :foreground "black"
  :box nil)

(defun my-tabbar-buffer-list ()
  (delq nil
        (mapcar #'(lambda (b)
                    (cond
                     ;; Always include the current buffer.
                     ((eq (current-buffer) b) b)
                     ((buffer-file-name b) b)
                     ((char-equal ?\  (aref (buffer-name b) 0)) nil)
                          ((equal "*scratch*" (buffer-name b)) b) ; Shows *scratch* buffer
                               ((char-equal ?* (aref (buffer-name b) 0)) nil) ;
                     ((buffer-live-p b) b)))
                (buffer-list))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))


(require 'direx)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)


(require 'server)
(unless (server-running-p)
  (server-start))

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
(setq default-frame-alist
      (append '((font . "fontset-16"))))


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
(setq frame-title-format (format "Emacs@%s : %%f" (system-name)))
(set-default 'mode-line-buffer-identification ; shows full path of the opening file
           '(buffer-file-name ("%f") ("%b")))

;; mode line
(set-face-foreground 'mode-line "green") ; bar colour

;; Display time on mode-line
(setq display-time-string-forms
  '((substring year -2) "/" month "/" day " " dayname " " 24-hours ":" minutes))
(display-time)


;; python-mode
(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map "\"" 'electric-pair)
            (define-key python-mode-map "\'" 'electric-pair)
            (define-key python-mode-map "(" 'electric-pair)
            (define-key python-mode-map "[" 'electric-pair)
            (define-key python-mode-map "{" 'electric-pair)))
(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))
(add-hook 'python-mode-hook '(lambda ()
     (define-key python-mode-map "\C-m" 'newline-and-indent)))
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

