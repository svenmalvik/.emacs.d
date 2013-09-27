(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


(defvar my-packages '(	starter-kit
		       	starter-kit-lisp
			starter-kit-bindings
			starter-kit-eshell
			clojure-mode
			clojure-test-mode
			nrepl))

(dolist (p my-packages)
	  (when (not (package-installed-p p))
	        (package-install p)))

(global-hl-line-mode 1)
 
(set-face-background 'hl-line "#111111")  

(global-linum-mode t)
(setq linum-format "%3d ")

(global-set-key [f12] 'kill-whole-line)
(global-set-key [f11] 'undo)
(global-set-key [right] 'other-window)
(global-set-key [left] (lambda ()
                                (interactive)
                                (other-window -1)))
(global-unset-key [up])
(global-unset-key [down])

(defun init-windows()
	(split-window-horizontally)
	(other-window 1)
	(eshell)
)

(init-windows)
