;;; Modifications for kernel coding style
;; see http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Docum/
;; entation/CodingStyle?id=refs/heads/master

(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
         (column (c-langelem-2nd-pos c-syntactic-element))
         (offset (- (1+ column) anchor))
         (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))))

(add-hook 'c-mode-hook
          (lambda ()
            (let ((filename (buffer-file-name)))
              ;; Enable kernel mode for the appropriate files
              (when (and filename
                         (string-match (expand-file-name "~/src/linux-trees")
                                       filename))
                (setq indent-tabs-mode t)
                (setq show-trailing-whitespace t)
                (c-set-style "linux-tabs-only")))))


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
;;(require 'column-marker)

;; highlight col 80 in foo mode (not sure what foo mode rly is yet)
;;(add-hook 'emacs-lisp-mode-hook (lambda ()
;;    (interactive) (column-marker-1 80)))

;; set 'C-c m' to interactively highlight with 'column-marker-1-face'
;;(global-set-key [?\C-c ?m] 'column-marker-1)
