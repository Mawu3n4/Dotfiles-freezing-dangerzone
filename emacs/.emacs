
;; Load Paths
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/expand-region")
(add-to-list 'load-path "~/.emacs.d/multiple-cursors")
(add-to-list 'load-path "~/.emacs.d/eval-and-replace")

;; Enable by default minor mode Highlight 80+
(require 'highlight-80+)
(add-hook 'prog-mode-hook 'highlight-80+-mode)

;; Share kill-region with xclip
(require 'xclip)

;; Use 4 spaces instead of tabs for indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode nil)
        (setq tab-width 4)
        (setq python-indent 4)))

;; Haskell Mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)


;; Web-mode (http://web-mode.org/) -- (disabled, slows emacs at launch)
;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

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

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)


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
