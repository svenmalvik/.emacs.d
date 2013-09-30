(require 'package)
(require 'recentf)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


(defvar my-packages '(	starter-kit
			starter-kit-bindings
			starter-kit-lisp
                        scala-mode
			clojure-mode
                        clojure-test-mode
                        starter-kit-eshell
			nrepl))

(dolist (p my-packages)
	  (when (not (package-installed-p p))
	        (package-install p)))

(global-linum-mode t)
(setq linum-format "%3d ")
(global-hl-line-mode 1) 
(set-face-background 'hl-line "#111111") 

(global-set-key "\M-7" 'paredit-open-square)
(global-set-key "\M-8" 'paredit-close-square)
(global-set-key "\M-?" 'delete-backward-char)


(global-set-key [f12] 'kill-whole-line)
(global-set-key [f11] 'undo)
(global-set-key [right] 'other-window)
(global-set-key (kbd "C-x 1") 'delete-window)
(global-set-key [left] (lambda ()
                                (interactive)
                                (other-window -1)))
(global-unset-key [up])
(global-unset-key [down])
(global-set-key (kbd "C-h") 'delete-backward-char)

(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key "\M-+" 'move-line-up)
(global-set-key "\M--" 'move-line-down)
;;(global-set-key "\M-s" 'shell)

(defun init-windows()
	(split-window-horizontally)
	(other-window 1)
	(recentf-open-files))

(recentf-mode 1)
(setq recentf-max-menu-items 40)
(global-set-key  (kbd "C-x C-r")  'recentf-open-files)

(init-windows)

(set-face-attribute  'mode-line
                 nil 
                 :foreground "gray80"
                 :background "#ff0000" 
                 :box '(:line-width 1 :style released-button))
(set-face-attribute  'mode-line-inactive
                 nil 
                 :foreground "gray30"
                 :background "#fcfcfc" 
                 :box '(:line-width 1 :style released-button))

