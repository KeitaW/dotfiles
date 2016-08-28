
;; Install uninstalled packages
(require 'cl)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(setq package-list 
  '(;; list of packages you need
    evil
    org
    org-plus-contrib
    solarized-theme
    ))

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

