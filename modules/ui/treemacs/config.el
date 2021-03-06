;;; ui/treemacs/config.el -*- lexical-binding: t; -*-

(setq treemacs-follow-after-init t
      treemacs-is-never-other-window t
      treemacs-sorting 'alphabetic-case-insensitive-desc
      treemacs-persist-file (concat doom-cache-dir "treemacs-persist")
      treemacs-last-error-persist-file (concat doom-cache-dir "treemacs-last-error-persist"))


(after! treemacs
  (set-popup-rule! "^ \\*Treemacs"
    :side treemacs-position
    :size treemacs-width
    :quit nil
    :ttl 0)

  ;; Don't follow the cursor
  (treemacs-follow-mode -1)

  ;; Allow ace-window to target treemacs windows
  (after! ace-window
    (delq! 'treemacs-mode aw-ignored-buffers)))


(use-package! treemacs-evil
  :when (featurep! :editor evil +everywhere)
  :after treemacs
  :config
  (define-key! evil-treemacs-state-map
    [return] #'treemacs-RET-action
    [tab]    #'treemacs-TAB-action
    "TAB"    #'treemacs-TAB-action
    ;; REVIEW Fix #1875 to be consistent with C-w {v,s}, but this should really
    ;;        be considered upstream.
    "o v"    #'treemacs-visit-node-horizontal-split
    "o s"    #'treemacs-visit-node-vertical-split))


(use-package! treemacs-projectile
  :after treemacs)


(use-package! treemacs-magit
  :when (featurep! :tools magit)
  :after treemacs magit)
