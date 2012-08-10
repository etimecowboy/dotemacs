;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-10 Fri 21:47 by xin on XIN-PC>
;;--------------------------------------------------------------------
;; File name:    `xy-rc-bookmark.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Depend on:    None
;; Description:  My `bookmark.el' settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)

;;;###autoload
(defun bookmark-preload ()
  "Settings of `bookmark.el' before it's been loaded."

  (setq-default bookmark-default-file
                (concat my-var-path "/bookmark-"
                        user-login-name "@"
                        system-name "@"
                        system-configuration))

  (message "* ---[ bookmark pre-load configuration is complete ]---"))

;;;###autoload
(defun bookmark-postload ()
  "Settings of `bookmark.el' after it's been loaded."

  (setq bookmark-save-flag 1)
  ;; BUG: not work! use default ~/.emacs.d/bookmarks instead.
  (setq bookmark-default-file
        (concat my-var-path "/bookmark-"
                user-login-name "@"
                system-name "@"
                system-configuration))
  ;; (unless (file-exists-p bookmark-default-file)
  ;;   (shell-command (concat "touch " bookmark-default-file)))

  (message "* ---[ bookmark post-load configuration is complete ]---"))

(provide 'xy-rc-bookmark)
