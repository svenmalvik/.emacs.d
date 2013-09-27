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

(global-linum-mode t)
(setq linum-format "%3d ")

(global-hl-line-mode 1)
 
(set-face-background 'hl-line "#111111") 

(global-set-key "\M-7" 'paredit-open-square)
(global-set-key "\M-8" 'paredit-close-square)
(global-set-key "\M-?" 'delete-backward-char)

