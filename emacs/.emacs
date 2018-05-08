
;; Load Paths
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/expand-region")
(add-to-list 'load-path "~/.emacs.d/multiple-cursors")
(add-to-list 'load-path "~/.emacs.d/eval-and-replace")
(add-to-list 'load-path "~/.emacs.d/emacs-jedi")
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/helm")
(add-to-list 'load-path "~/.emacs.d/emacs-async")

(require 'helm-config)

;; Install packages
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)


;; Speedbar
;; Open Speedbar at startup if frame is big enough
(when
    (> (frame-width) 120)
  (add-hook 'emacs-startup-hook (lambda ()
                                  (sr-speedbar-open)
                                  )))

(global-set-key (kbd "C-\\") (lambda()
                               (interactive)
                               (setq current-file (buffer-file-name))
                               (sr-speedbar-refresh)
                               (switch-to-buffer-other-frame "*SPEEDBAR*")
                               (speedbar-find-selected-file current-file)
                               (speedbar-expand-line)
                               (other-window 1)
                               (delete-window)
                               (other-window -1)
                               )
                )

;; Remap some funcs
(add-hook 'speedbar-reconfigure-keymaps-hook
          '(lambda ()
             (define-key speedbar-mode-map [S-up] 'speedbar-up-directory)
             (define-key speedbar-mode-map [right] 'speedbar-flush-expand-line)
             (define-key speedbar-mode-map [left] 'speedbar-contract-line)
             (define-key speedbar-mode-map [M-up] 'speedbar-restricted-prev)
             (define-key speedbar-mode-map [M-down] 'speedbar-restricted-next)
             (define-key speedbar-mode-map [up] 'speedbar-prev)
             (define-key speedbar-mode-map [down] 'speedbar-next)
             (define-key speedbar-mode-map [C-M-up] 'speedbar-backward-list)
             (define-key speedbar-mode-map [C-M-down] 'speedbar-forward-list)
             )
          )
;; Dirty hack for synchronous writing
(defun sync-writing ()
  (interactive)
  (run-with-idle-timer 1 1 'save-buffer)
  (remove-hook 'before-save-hook 'whitespace-cleanup)
  )


(defadvice epc:make-procbuf (around foo activate)
  ad-do-it
  (with-current-buffer ad-return-value
    (rename-buffer (concat " " (buffer-name)))
        (setq ad-return-value (buffer-name))))
;; i3-like bindings for tiled buffers
(global-set-key (kbd "M-s <right>") (lambda()
                                      (interactive)
                                      (other-window 1)
                                      (delete-window)))

(global-set-key (kbd "M-s  <left>") (lambda()
                                      (interactive)
                                      (other-window -1)
                                      (delete-window)))

(global-set-key (kbd "<M-right>") 'other-window)
(global-set-key (kbd "<M-left>") (lambda()
                                   (interactive)
                                   (other-window -1)))

(global-set-key (kbd "C-x v") 'split-window-below)
(global-set-key (kbd "C-x h") 'split-window-right)
;; --Speedbar--

(global-set-key (kbd "<M-up>") 'delete-indentation)

;; ;; Projectile
;; (projectile-global-mode)q
;; (helm-projectile-on)
;; (global-set-key (kbd "C-c C-p") 'helm-projectile-switch-project)

;; (defun projectile-helm-ag ()
;;        (interactive)
;;        (helm-do-ag (projectile-project-root)))
;; (global-set-key (kbd "C-c #") 'projectile-helm-ag)
;; (global-set-key (kbd "C-c '") 'helm-projectile-find-file)

;; (require 'projectile-speedbar)
;; (global-set-key (kbd "C-<f2>") 'projectile-speedbar-open-current-buffer-in-tree)
;; ;; --Projectile--


(global-set-key (kbd "M-`") 'next-buffer)


;; Fuzzy search by default
(global-set-key (kbd "C-x C-f") 'fiplr-find-file)


;; RST
(require 'rst)
(setq auto-mode-alist
      (append '(("\\.txt$" . rst-mode)
                ("\\.rst$" . rst-mode)
                ("\\.rest$" . rst-mode)) auto-mode-alist))


;; Enable by default minor mode Highlight 80+
(require 'highlight-80+)
(add-hook 'prog-mode-hook 'highlight-80+-mode)


;; Share kill-region with xclip
(require 'xclip)


;; JS Comments style
(add-hook 'js-mode-hook (lambda () (setq comment-start "/*"
                                         comment-end   "*/")))


;; Use 4 spaces instead of tabs for indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)


;; Python
;; Add/remove level of indent
(global-set-key (kbd "C-M-<left>") (lambda()
                                     (interactive)
                                     (replace-regexp "^    " "")))
(global-set-key (kbd "C-M-<right>") (lambda()
                                      (interactive)
                                      (replace-regexp "^" "    ")))

;; PEP8 import order
;; (require 'py-isort)
;; (add-hook 'before-save-hook 'py-isort-before-save)

;; Window stuff
(defadvice split-window (after move-point-to-new-window activate)
  "Moves the point to the newly created window after splitting."
  (other-window 1))

;; Enable gtags and fix space indent
(add-hook 'python-mode-hook
          (lambda ()
            (gtags-mode t)
            (setq indent-tabs-mode nil)
            (setq tab-width 4)
            (setq python-indent 4)
            (projectile-mode)))


(add-hook 'python-mode-hook 'flycheck-mode)

(autoload 'jedi:setup "jedi" nil t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional


(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (when (not (subsetp (list (current-buffer)) (tramp-list-remote-buffers)))
      (let* ((temp-file (flymake-init-create-temp-buffer-copy
                         'flymake-create-temp-inplace))
             (local-file (file-relative-name
                          temp-file
                          (file-name-directory buffer-file-name))))
        (list "pyflakes" (list local-file)))))
  (add-to-list 'flymake-allowed-file-name-masks
                              '("\\.py\\'" flymake-pyflakes-init)))


;; JavaScript
(add-hook 'js-mode-hook
      (lambda ()
        (setq indent-tabs-mode nil)
        (setq tab-width 4)
        (setq python-indent 4)))


;; Haskell Mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)


;; Makes *scratch* empty.
(setq initial-scratch-message "")
;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)
;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")
;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
          '(lambda ()
             (let ((buffer "*Completions*"))
               (and (get-buffer buffer)
                    (kill-buffer buffer)))))
;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)
;; Show only one active window when opening multiple files at the same time.
(add-hook 'window-setup-hook 'delete-other-windows)


;; Expand-region (Magnars @EmacsRocks)
(require 'expand-region)
(global-set-key (read-kbd-macro "M-=") 'er/expand-region)


;; Multiple-cursos, sublime-like (Magnars @EmacsRocks)
(require 'multiple-cursors)
(global-set-key (kbd "C-c c") 'mc/edit-lines)
(global-set-key (kbd "M-l") 'mc/mark-next-like-this)
(global-set-key (kbd "M-'") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-.") 'mc/mark-all-like-this)

;; Eval lisp expression and replace with result
(defun fc-eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (prin1 (eval (read (current-kill 0)))
         (current-buffer)))

(global-set-key (kbd "C-c C-e") 'fc-eval-and-replace)

;; Increment number after buffer, handy with multiple cursors
(defun increment-number-at-point ()
  (interactive)
  (insert "(1+ ")
  (search-forward-regexp "[^0-9]")
  (backward-char)
  (insert ")")
  (fc-eval-and-replace))

(global-set-key (kbd "C-c i") 'increment-number-at-point)

;; J mode
(add-to-list 'load-path "/path/to/j-mode/")
(autoload 'j-mode "j-mode.el" "Major mode for editing J files" t)
(add-to-list 'auto-mode-alist '("\\.ij[rstp]$" . j-mode))

;; goto line #
(global-set-key (kbd "C-c C-g") 'goto-line)


;; Needs rxvt-unicode-256 and 256 colors-able terminal
;; Highlight current line
;; (global-hl-line-mode)
;; (set-face-background hl-line-face "gray5")

;; Ocaml Tuareg mode
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(autoload 'tuareg-imenu-set-imenu "tuareg-imenu"
  "Configuration of imenu for tuareg" t)
(add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
(add-to-list 'auto-mode-alist '("\\.ml'" . tuareg-mode))

;; Basic headers, taken from EPITECH's headers
(setq user-full-name "zackaria dibe")
(setq user-nickname "zackaria dibe")
(load "std.el")
(load "std_comment.el")

;; coloring mode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(autoload 'cuda-mode "cuda-mode" "For cuda .cu files" t)
(autoload 'glsl-mode "glsl-mode" "For .vert and .frag glsl files" t)
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.vert$" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag$" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.cu$" . cuda-mode))

;; Emacs style
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(column-number-mode 1)
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq-default fill-column 80)
(setq-default show-trailing-whitespace 1)
;;(cua-mode 1)
(set-default-font "Inconsolata-11")
(if (file-exists-p "~/.myemacs")
    (load-file "~/.myemacs"))
; EOF
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)


;; Whitespace mode
(load "utils.el")
(load "whitespace.el")

;; display only tails of lines longer than 80 columns, tabs and
;; trailing whitespaces
(setq whitespace-line-column 80
      whitespace-style '(tabs trailing lines-tail))

;; face for long lines' tails
(set-face-attribute 'whitespace-line nil
		    :background "red1"
		    :foreground "yellow"
		    :weight 'bold)

;; face for Tabs
(set-face-attribute 'whitespace-tab nil
		    :background "red1"
		    :foreground "yellow"
		    :weight 'bold)
;; activate minor whitespace mode when in python mode
(add-hook 'c-mode-hook 'whitespace-mode)
(add-hook 'python-mode-hook 'highlight-80+-mode)
(add-hook 'c-mode-hook 'highlight-80+-mode)
(add-hook 'js-mode-hook 'highlight-80+-mode)
(add-hook 'c++-mode-hook 'highlight-80+-mode)
;; nuke whitespaces when writing to a file
(add-hook 'before-save-hook 'whitespace-cleanup)
;; save whitespace-mode variables
(add-to-list 'desktop-globals-to-save 'whitespace-line-column)
(add-to-list 'desktop-globals-to-save 'whitespace-style)
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
;; (ac-config-default)


;; Ugly, needs to be moved to separate .el file
;;HEADER GUARDS
 (global-set-key [f12]
		 '(lambda ()
		       (interactive)
			  (if (buffer-file-name)
				     (let*
					    ((fName (upcase (file-name-nondirectory (file-name-sans-extension buffer-file-name))))
						 (ifDef (concat "#ifndef\t\t" fName "_H_" "\n# define\t" fName "_H_" "\n"))
						     (begin (point-marker))
							 )
					(progn
					  ; If less then 5 characters are in the buffer, insert the class definition
					     (if (< (- (point-max) (point-min)) 5 )
							(progn
							   (insert "\nclass\t\t" fName " {\n\npublic:\n\nprivate:\n\n};\n")
							    (goto-char (point-min))
							     (next-line-nomark 3)
							      (setq begin (point-marker))
							       )
						    )

					     ;Insert the Header Guard
						(goto-char (point-min))
						   (insert ifDef)
						      (goto-char (point-max))
							 (insert "\n#endif" "\t\t//" fName "_H__")
							    (goto-char begin))
					 )
				 ;else
				 (message (concat "Buffer " (buffer-name) " must have a filename"))
				      )
			     )
		 )


;;HEADER GUARDS END
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(comment-multi-line t)
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(global-auto-revert-mode t)
