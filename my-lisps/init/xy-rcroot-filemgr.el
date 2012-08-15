;;   -*- mode: emacs-lisp; coding: utf-8-unix  -*-
;; Time-stamp: <2012-08-14 Tue 17:10 by xin on p5q>
;;--------------------------------------------------------------------
;; File name:    `xy-rcroot-filemgr.el'
;; Author:       Xin Yang
;; Email:        xin2.yang@gmail.com
;; Description:  File management packages settings
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;;  \____|_| |_| |_|\__,_|\___|___/
;;
;;--------------------------------------------------------------------

(eval-when-compile (require 'cl))
(require 'xy-rc-utils)


;;* Buffer management

;; 按下C-x k立即关闭掉当前的buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)


;;** ibuffer
(eval-after-load "ibuffer" '(ibuffer-postload))
(global-set-key (kbd "C-x C-b") 'ibuffer)


;;** uniquify
;; 可以为重名的 buffer 在前面加上其父目录的名字来让名字区分开来，
(eval-after-load "uniquify" '(uniquify-postload))
(require 'uniquify)


;;* File management

;;** dired
(eval-after-load "dired"
  '(progn
     (dired-postload)
     (eal-define-keys-commonly
      global-map
      `(("C-x d" dired-jump)))
     (eal-define-keys
      'dired-mode-map
      `(("C-c C-x 3" dired-two-columns)
        ;; ("M-b s"    dired-sort-by-size)
        ;; ("M-b x"    dired-sort-by-extension)
        ;; ("M-b t"    dired-sort-by-time)
        ;; ("M-b n"    dired-sort-by-name)
        ("M-o"       dired-omit-mode)
        ;; ("E"         dired-ediff)
        ;; ("C-M-/"     dired-undo
        ;; ("C-M-?"     dired-redo)
        ("C-M-k"     dired-do-delete)
        ("M-q"       ywb-dired-quickview)
        ;; ("/m"        ywb-dired-filter-regexp)
        ;; ("/."        ywb-dired-filter-extension)
        ;; ("M->"       wuxch-dired-goto-last-line)
        ;; ("M-<"       wuxch-dired-goto-first-line)
        ;; ("M-w"       wuxch-dired-copy)
        ;; ("C-y"       wuxch-dired-paste)
        ;; ("M-k"       wuxch-dired-cut
        ("X"         mrc-dired-do-command)
        ;; ("q"         kill-this-buffer) ;; BUG: cause `sunrise' error
        ))))

;;*** GNU Emacs features for dired
;; 对特定文件简略显示
(eval-after-load "dired-x" '(dired-x-postload))
;; (require 'dired-x)

;; 以文件形式修改dired buffer,  has been a part of GNU Emacs since 23
;; (require 'wdired)

;; 只对文件名isearch
;;   NOTE: Emacs 23 has builtin Isearch of filenames in Dired:
;;     M-s f C-s   – `dired-isearch-filenames'
;;     M-s f C-M-s – `dired-isearch-filenames-regexp'
;;     M-s a C-M-s – `dired-do-isearch-regexp'
;; (eval-after-load "dired-isearch" '(dired-isearch-postload))

;;*** Contrib features for dired
;; Use a single frame for visiting a sub-directory
;; (eval-after-load "dired-single" (dired-single-postload))
;; `T' 把目录压缩为.tar.gz文件
;; (require 'dired-tar)

;; open-with, open files in external applications
;; NOTE: it need to be patched in order to run on windows
;; NOTE: semms not work in Linux, `dired+' is better.
;; (eval-after-load "openwith" '(openwith-postload))
;; (when (try-require 'openwith) (openwith-mode 1))

;; dired-details
;; 简略文件列表信息, BUG: not working properly
;; (eval-after-load "dired-details" '(dired-details-postload))
;; (require 'dired-details)
;; ;; (dired-details-install) ;; called in `dired-details+'
;; (setq dired-details-hide-link-targets nil
;;       dired-details-initially-hide t
;;       dired-details-hidden-string "")
;; (require 'dired-details+)
;; (setq dired-details-propagate-flag t) ;option added by
;;                                         ;`dired-details+'

;; TODO: do a research and add more configurations.
(eval-after-load "dired+" '(dired+-postload)) ;; dired大补
;; (require 'dired+)
;; (setq diredp-prompt-for-bookmark-prefix-flag nil)

;; BUG: NOT work
;; Pop up a sort menu when press `C-d' or `S-mouse2' in dired mode
;; (eval-after-load "dired-sort-menu" '(dired-sort-menu-postload))
(when window-system
  ;; image-dired
  (image-dired-preload)
  (eval-after-load "image-dired" '(image-dired-postload))
  ;; thumbs, Thumbnails previewer for images files
  (thumbs-preload)
  (eval-after-load "thumbs" '(thumbs-postload)))


;; ** w32-browser
(Windows
 (try-require 'w32-browser))


;;** Sunrise commander; file manager
;; BUG: NOT work properly with other dired lisps. Removed.
;; Check (@url :file-name "http://www.emacswiki.org/emacs/Sunrise_Commander_Tips" :display "emacswiki")
(eval-after-load "sunrise-commander" '(sunrise-postload))
(global-set-key (kbd "C-x J") 'sunrise)


;;* Version control settings

;;** Emacs internal version control
(setq make-backup-files t)
(setq version-control t)
(setq backup-by-copying t)
(setq backup-directory-alist '(("." . "~/.emacs-backup")))
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq vc-make-backup-files t)
(setq auto-revert-check-vc-info t)

;; Autosaved files
(setq auto-save-default nil)
(setq-default auto-save-list-file-prefix
              (concat my-var-path "/auto-save-list/auto-saves-"
                      user-login-name "@" system-name "@" system-configuration
                      "-"))


;;** git settings

;;*** git.el

;;*** egg
;; (eval-after-load "egg" '(egg-postload))

;;*** magit
(eval-after-load "magit"
  '(progn
     (magit-postload)
     (eal-define-keys-commonly
      magit-mode-map
      `(("M-n"   magit-show-commit-forward)
        ("M-p"   magit-show-commit-backward)
        ("q"     delete-window)
        ))))
(global-set-key (kbd "<f11> g") 'magit-status)
(global-set-key (kbd "<f11> w") 'xy/magit-wip-start)

;;*** diff-git
(eval-after-load "diff-git"
  '(progn
     (diff-git-postload)
     (eal-define-keys 'vc-prefix-map
                      `(("[" diff-git-diff-unstaged)
                        ("]" diff-git-diff-staged)))
     (eal-define-keys 'diff-mode-map
                      `(("C-c M-v" diff-git-buffer-stage)
                        ("C-c C-v" diff-git-diff-staged)))
     (define-key diff-mode-shared-map "g" 'diff-git-update-current-buffer)))
(global-set-key (kbd "<f11> u") 'diff-git-diff-unstaged)
(global-set-key (kbd "<f11> s") 'diff-git-diff-staged)

;;;*** mo-git-blame
(eval-after-load "diff-git" '(diff-git-postload))
(global-set-key (kbd "<f11> c") 'mo-git-blame-current)
(global-set-key (kbd "<f11> f") 'mo-git-blame-file)

;;** diff-hl
;; Highlight vc diff section of current file
(when (try-require 'diff-hl) (global-diff-hl-mode))


(provide 'xy-rcroot-filemgr)
