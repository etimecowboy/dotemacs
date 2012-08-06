;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-05 Sun 20:44 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-simple.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `simple.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun simple-postload ()
  "Settings of `simple.el' after it's been loaded."
  (setq-default fill-column 70)
  (message "* ---[ simple post-load configuration is complete ]---"))

(provide 'xy-rc-simple)
