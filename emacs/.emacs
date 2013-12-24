
(add-to-list 'load-path "/home/clrdr/.emacs.d/")

;; Ocaml Tuareg mode
    (add-to-list 'load-path "~/.elisp/tuareg-mode")
    (autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
    (autoload 'camldebug "camldebug" "Run the Caml debugger" t)
    (autoload 'tuareg-imenu-set-imenu "tuareg-imenu"
      "Configuration of imenu for tuareg" t)
    (add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
    (setq auto-mode-alist
	(append '(("\\.ml[ily]?$" . tuareg-mode)
			    ("\\.topml$" . tuareg-mode))
		  auto-mode-alist))

;; Epitech headers
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
;; nuke whitespaces when writing to a file
(add-hook 'before-save-hook 'whitespace-cleanup)
;; save whitespace-mode variables
(add-to-list 'desktop-globals-to-save 'whitespace-line-column)
(add-to-list 'desktop-globals-to-save 'whitespace-style)
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)


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


(require 'highlight-80+)

;;HEADER GUARDS END
