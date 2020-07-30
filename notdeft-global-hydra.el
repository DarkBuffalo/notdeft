;;; notdeft-global-hydra.el --- Hydra for NotDeft  -*- lexical-binding: t; -*-

;; Copyright (C) 2018 by the author.
;; All rights reserved.
;; Author: Tero Hasu <tero@hasu.is>
;; See "notdeft.el" for licensing information.

;;; Commentary:
;; A hydra for some of NotDeft's globally usable commands; intended to
;; be “helpful” without much support for command chaining. Defines the
;; command `notdeft-global-hydra/body', and adds the hydra bindings to
;; an internal keymap. The `notdeft-global-hydra/body' command can be
;; bound as desired to access the commands with short key sequences
;; and textual hints in the Hydra command group context. It makes
;; available roughly the same bindings as in `notdeft-global-map', but
;; in a different way.
;;
;; To bind the hydra, one can for example:
;;   (autoload 'notdeft-global-hydra/body "notdeft-global-hydra" nil t)
;;   (global-set-key [f6] 'notdeft-global-hydra/body)

;;; Code:

(require 'hydra)

;; Functions without autoloads.
(declare-function notdeft-buffer-p "notdeft")

(defhydra notdeft-global-hydra (:exit t)
  "NotDeft"
  ;; file management
  ("n" notdeft-new-file "create")
  ("m" notdeft-new-file-named "create named")
  ("C-f" notdeft-find-file "open")
  ("C-w" notdeft-save-buffer "save" :exit nil)
  ("d" notdeft-delete-file "delete")
  ("r" notdeft-rename-file "rename")
  ("v" notdeft-move-file "move")
  ("s" notdeft-move-into-subdir "move into subdir")
  ("e" notdeft-change-file-extension "change ext")
  ("a" notdeft-archive-file "archive")
  ("i" notdeft-show-file-directory "show dir" :exit nil)
  ("x d" notdeft-open-in-deft "Deft")
  ;; state
  ("j" notdeft-chdir "chdir" :exit nil)
  ("g" notdeft-refresh "refresh" :exit nil)
  ("x c" notdeft-gc "GC" :exit nil)
  ("x r" notdeft-reindex "reindex" :exit nil)
  ;; search
  ("o" notdeft-open-query "search")
  ("f" notdeft-query-ido-find-file "search/open")
  ("x o" notdeft-lucky-find-file "lucky search")
  ;; movement
  ("b" notdeft-switch-to-note-buffer "switch to note")
  ("B" notdeft-switch-to-buffer "switch to buffer")
  ;; other
  ("z" (when (notdeft-buffer-p)
	 (notdeft-mode-hydra/body)) "more")
  ("." notdeft "NotDeft")
  ("C-g" nil "cancel"))

(provide 'notdeft-global-hydra)

;;; notdeft-global-hydra.el ends here
