;;; Personal Libraries
;; adds 'emacslibs' directory to front of 'load-path' var
;; this dir contains lisp libraries for Column Marker, Fill Column Indicator
(add-to-list 'load-path "/home/vagrant/configure-IDE/emacs/emacslibs")


;;; Fill Column Indicator
;; include Fill Column Indicator lib (see https://github.com/alpaker/Fill-Column
;; -Indicator)
(require 'fill-column-indicator)

;; set the default fill-column to 80
(setq-default fill-column 80)

;; this makes default emacs-lisp-mode mode hook into fci-mode
(add-hook 'emacs-lisp-mode-hook (lambda ()
    (fci-mode 1)
  ))


;;; Column Marker
;; include Column Marker lib (see https://www.emacswiki.org/emacs/ColumnMarker)
(require 'column-marker)

;; highlight col 80 in foo mode (not sure what foo mode rly is yet)
(add-hook 'foo-mode-hook (lambda () (interactive) (column-marker-1 80)))

;; set 'C-c m' to interactively highlight with 'column-marker-1-face'
(global-set-key [?\C-c ?m] 'column-marker-1)
