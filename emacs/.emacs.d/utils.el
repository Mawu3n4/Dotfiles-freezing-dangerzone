;; Lancer le man
(defun vectra-man-on-word ()
  "Appelle le man sur le mot pointe par le curseur"
  (interactive)
  (manual-entry (current-word)))
 
;; Suppression des espaces en fin de ligne a l'enregistrement
(autoload 'nuke-trailing-whitespace "whitespace" nil t)

;; Colorise en Rouge les espace 
(setq show-trailing-whitespace t)
(setq-default show-trailing-whitespace t)
 
;; Laisser le curseur en place lors d'un defilement par pages.
;; Par defaut, Emacs place le curseur en debut ou fin d'ecran
;; selon le sens du defilement.
(setq scroll-preserve-screen-position t)
 
;; Complette automatiquement ce que vous tapez dans le mini-buffer
(icomplete-mode 1)
 
;; Pouvoir utiliser la completition sous emacs en ignorant la casse
(setq completion-ignore-case t)
 
;; Supprime les fichier ~
(setq make-backup-files nil)
 
;; parenthese em couleur
(custom-set-variables
 '(show-paren-mode t))
(custom-set-faces)
 
;; yes > y | no > n
(fset 'yes-or-no-p 'y-or-n-p)
 
;; Affiche le numero de ligne et de colonne
(column-number-mode t)
(line-number-mode t)
 
;; Enlever le message au demarrage
(setq inhibit-startup-message t)
 
;; Remplacer le texte selectionne si on tape
(delete-selection-mode t)
 
;; Affiche l'heure au format 24h
(setq display-time-24hr-format t)
(setq displat-time-day-and-date t)
 
;; Sauvegarder la session
(desktop-load-default)
(desktop-read)
 
;; ido mode
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)