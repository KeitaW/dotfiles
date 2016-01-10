(keyboard-translate ?\C-h ?\C-?)
;; ツールバーを非表示
(tool-bar-mode 0)
;; 行番号表示
(global-linum-mode)
(when (eq system-type 'darwin)
   (setq mac-option-modifier 'meta))
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/")))))
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)
(require 'evil)
(evil-mode 1)
;; Make movement keys work like they should
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
; Make horizontal movement cross lines
(setq-default evil-cross-lines t)
(require 'ox-latex)
(require 'ox-bibtex)

(setq org-latex-pdf-process
      '("platex %f"
        "platex %f"
        "bibtex %b"
        "platex %f"
        "platex %f"
        "dvipdfmx %b.dvi"))
(add-to-list 'org-latex-classes
             '("thesis"
               "\\documentclass[12pt, a4paper]{article}
                [NO-PACKAGES]
                [NO-DEFAULT-PACKAGES]
                \\usepackage[dvipdfmx]{graphicx}
		\\usepackage{amsmath}
                \\usepackage{natbib}
                \\usepackage[dvipdfm]{geometry}
		\\usepackage[boxed]{algorithm2e}
                \\geometry{left=20mm,right=20mm,top=35mm,bottom=30mm} % 余白の微調整
                "
	       ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
               ))
(setq org-latex-with-hyperref nil)
;; bigger latex fragment
(plist-put org-format-latex-options :scale 1.2)
;; inline figure size setting
;; (setq org-image-actual-width 10)
(defun set-exec-path-from-shell-PATH ()
  "Sets the exec-path to the same value used by the user shell"
  (let ((path-from-shell
         (replace-regexp-in-string
          "[[:space:]\n]*$" ""
          (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(set-exec-path-from-shell-PATH)


(require 'ess-site)
(require 'helm-config)
;(unless (package-installed-p 'atom-dark-theme)
;   (package-refresh-contents) (package-install 'atom-dark-theme))
					;(load-theme 'atom-dark t)
;(load-theme 'solarized t)
(load-theme 'sanityinc-solarized-dark t)

(autoload 'haskell-mode "haskell-mode" nil t)
(autoload 'haskell-cabal "haskell-cabal" nil t)
 
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))

;; indent の有効.
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'font-lock-mode)
(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)
;; Haskell Scriptの編集モード
(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))
;; M-x run-haskellでghciが起動
(setq haskell-program-name "/usr/local/bin/ghci")


