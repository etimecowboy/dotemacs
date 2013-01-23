;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2013-01-15 Tue 17:20 by xin on S13>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-pp-c-l.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `pp-c-l.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun turn-on-pretty-control-l-mode ()
  "Turn on pretty-control-l-mode."
  (interactive)
  (require 'pp-c-l)
  (pretty-control-l-mode 1))

;;;###autoload
(defun pp-c-l-face ()
  "Face setttings of `pp-c-l.el'."
  (interactive)
  (if window-system
      (custom-set-faces
        '(pp^L-highlight ((t (:strike-through t)))))
    (custom-set-faces '(pp^L-highlight ((t (:background "cyan")))))))

;;;###autoload
(defun pp-c-l-postload ()
  "Settings of `pp-c-l.el' after it's been loaded."

  (setq pp^L-^L-string-function (lambda (win)
                  (make-string
                   (1- (+ (window-width win) -10)) ? )))

  (message "* ---[ pp-c-l post-load configuration is complete ]---"))

(provide 'xy-rc-pp-c-l)
