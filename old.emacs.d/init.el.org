(keyboard-translate ?\C-h ?\C-?)
;; ツールバーを非表示
(tool-bar-mode 0)
;; 危険なコマンドを封印
(global-set-key (kbd "C-x C-l") 'nil)
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
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defun package-install-with-refresh (package)
  (unless (assq package package-alist)
    (package-refresh-contents))
  (unless (package-installed-p package)
    (package-install package)))

;; Install evil
(package-install-with-refresh 'evil)(package-initialize)
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
(require 'table)
(setq org-latex-pdf-process
      '("platex %f"
        "platex %f"
        "bibtex %b"
        "platex %f"
        "platex %f"
        "dvipdfmx %b.dvi"))
(setq org-export-latex-date-format "%Y-%m-%d")
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

(add-to-list 'org-latex-classes
             '("mybeamer"
		"\\documentclass[dvipdfmx, 14pt, presentation]{beamer}
                [NO-PACKAGES]
                [NO-DEFAULT-PACKAGES]
		\\mode<presentation>{
			\\usetheme{AnnArbor}
			\\usecolortheme{}
		}
		\\usepackage{graphicx}
		\\usepackage{color}
		\\setbeamertemplate{navigation symbols}{}
		\\setbeamertemplate{blocks}[rounded][shadow=false]
		\\setbeamertemplate{itemize items}{\checkmark}
		\\setbeamerfont*{block title}{size=\Large}
		\\setbeamerfont*{block body}{size=\large}
		\\definecolor{ThickBlue}{RGB}{26,77,122} 
		\\definecolor{ThickRed}{RGB}{160,52,41} 
		\\definecolor{BlueForChar}{RGB}{19, 59, 94} 
		\\definecolor{ThinYellow}{RGB}{253, 253, 199}
		\\definecolor{AlertOrange}{RGB}{255,76,0}
		\\definecolor{AlmostBlack}{RGB}{26,77,122}
		\\setbeamercolor{Blue-Yellow}{fg=BlueForChar, bg=ThinYellow}
		\\setbeamercolor{white-Blue}{fg=white, bg=ThickBlue}
		\\setbeamercolor{white-Red}{fg=white, bg=ThickRed}
		\\setbeamercolor{block title}{fg=white, bg=ThickBlue} 
		\\setbeamercolor{block body}{fg=BlueForChar}
		\\setbeamercolor{alerted text}{fg=AlertOrange} 
		\\setbeamercolor*{bibliography entry title}{fg=ThickBlue}
		\\renewcommand{\\pgfuseimage}[1]{\\includegraphics[scale=.6]{#1}}
                "
		org-beamer-sectioning
               ))
(setq org-latex-with-hyperref nil)
(setq org-image-actual-width 200)
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
;; Aspellの設定 mac
(add-to-list 'exec-path "/usr/local/Cellar/aspell/0.60.6.1/bin")
(set-default 'ispell-program-name "aspell")

;; persp-modeの設定
(setq persp-keymap-prefix (kbd "C-c p")) ;prefix
(setq persp-add-on-switch-or-display t) ;バッファを切り替えたら見えるようにする
(persp-mode 1)
(defun persp-register-buffers-on-create ()
  (interactive)
  (dolist (bufname (condition-case _
                       (helm-comp-read
                        "Buffers: "
                        (mapcar 'buffer-name (buffer-list))
                        :must-match t
                        :marked-candidates t)
                     (quit nil)))
    (persp-add-buffer (get-buffer bufname))))
(add-hook 'persp-activated-hook 'persp-register-buffers-on-create)

;; ace-jump-modeの設定
;; ヒント文字に使う文字を指定する
(setq ace-jump-mode-move-keys
      (append "asdfghjkl;:]qwertyuiop@zxcvbnm,." nil))
;; ace-jump-word-modeのとき文字を尋ねないようにする
(setq ace-jump-word-mode-use-query-char nil)
(global-set-key (kbd "C-:") 'ace-jump-char-mode)
(global-set-key (kbd "C-;") 'ace-jump-word-mode)
(global-set-key (kbd "C-M-;") 'ace-jump-line-mode)

;; ace-isearchの設定
(global-ace-isearch-mode 1)

;; twit
(require 'twittering-mode)
(put 'downcase-region 'disabled nil)

;; windowリサイズ系コマンド ( http://d.hatena.ne.jp/mooz/20100119/p1 )
(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        c)
    (catch 'end-flag
      (while t
        (message "size[%dx%d]"
                 (window-width) (window-height))
        (setq c (read-char))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (message "Quit")
               (throw 'end-flag t)))))))

;; C-q をプリフィックスキー化
(define-key global-map "\C-q" (make-sparse-keymap))

;; quoted-insert は C-q C-q へ割り当て
(global-set-key "\C-q\C-q" 'quoted-insert)

;; window-resizer は C-q C-r (resize) で
(global-set-key "\C-q\C-r" 'window-resizer)

;; C-x o にはもううんざり
(global-set-key "\C-ql" 'windmove-right)
(global-set-key "\C-qh" 'windmove-left)
(global-set-key "\C-qj" 'windmove-down)
(global-set-key "\C-qk" 'windmove-up)
