;;;; everforest.el --- A green-based, warm theme for Emacs -*- lexical-binding: t -*-

;; Copyright (c) 2013 Lee Machin
;; Copyright (c) 2013-2016 Eduardo Lavaque
;; Copyright (c) 2016-2017 Jason Milkins
;; Copyright (c) 2017-2018 Martijn Terpstra
;; Copyright (c) 2021 Andrew Burch

;; Author: Andrew Burch <andrewwburch@gmail.com>
;; (current maintainer)
;;
;; URL: http://github.com/ablatedsprocket/emacs-theme-everforest
;; Version: 1.0.0

;; Package-Requires: ((autothemer "0.2"))

;;; Commentary:

;; Using autothemer since 1.00

;; A port of the Everforest colorscheme for Vim.
;;

;;; Credits:

;; sainnhe created the original theme for Vim, on which this port
;; is based.

;; Lee Machin created the codebase this theme was adapted to.
;; Greduan developed further adding support for several major modes.

;;; Code:
(eval-when-compile
  (require 'cl-lib))

(require 'autothemer)

(unless (>= emacs-major-version 24)
  (error "Requires Emacs 24 or later"))
;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(defmacro everforest-deftheme (name description palette &rest body)
  `(autothemer-deftheme
    ,name
    ,description
    ,palette
    ((default                                   (:background everforest-bg :foreground everforest-light0))
     (cursor                                    (:background everforest-light0))
     (mode-line                                 (:background everforest-dark3 :foreground everforest-light2 :box nil))
     (mode-line-inactive                        (:background everforest-dark1 :foreground everforest-light4 :box nil))
     (fringe                                    (:background everforest-bg))
     (hl-line                                   (:background everforest-dark1))
     (region                                    (:background everforest-dark2)) ;;selection
     (secondary-selection                       (:background everforest-dark1))
     (minibuffer-prompt                         (:background everforest-bg :foreground everforest-bright_green :bold t))
     (vertical-border                           (:foreground everforest-dark2))
     (internal-border                           (:background everforest-dark2))
     (window-divider                            (:foreground everforest-dark2))
     (link                                      (:foreground everforest-faded_blue :underline t))
     (shadow                                    (:foreground everforest-dark4))

     ;; Built-in syntax

     (font-lock-builtin-face                            (:foreground everforest-bright_orange))
     (font-lock-constant-face                           (:foreground everforest-bright_purple))
     (font-lock-comment-face                            (:foreground everforest-dark4))
     (font-lock-function-name-face                      (:foreground everforest-bright_yellow))
     (font-lock-keyword-face                            (:foreground everforest-bright_red))
     (font-lock-string-face                             (:foreground everforest-bright_green))
     (font-lock-variable-name-face                      (:foreground everforest-bright_blue))
     (font-lock-type-face                               (:foreground everforest-bright_purple))
     (font-lock-warning-face                            (:foreground everforest-bright_red :bold t))

     ;; Basic faces
     (error                                             (:foreground everforest-bright_red :bold t))
     (success                                           (:foreground everforest-bright_green :bold t))
     (warning                                           (:foreground everforest-bright_yellow :bold t))
     (alert-low-face                                    (:foreground everforest-bright_blue))
     (trailing-whitespace                               (:background everforest-bright_red))
     (escape-glyph                                      (:foreground everforest-bright_aqua))
     (header-line                                       (:background everforest-dark0 :foreground everforest-light3 :box nil :inherit nil))
     (highlight                                         (:background everforest-dark4 :foreground everforest-light0))
     (homoglyph                                         (:foreground everforest-bright_yellow))
     (match                                             (:foreground everforest-dark0 :background everforest-bright_blue))

     ;; Customize faces
     (widget-field                                      (:background everforest-dark3))
     (custom-group-tag                                  (:foreground everforest-bright_blue :weight 'bold))
     (custom-variable-tag                               (:foreground everforest-bright_blue :weight 'bold))

     ;; whitespace-mode

     (whitespace-space                          (:background everforest-bg :foreground everforest-dark4))
     (whitespace-hspace                         (:background everforest-bg :foreground everforest-dark4))
     (whitespace-tab                            (:background everforest-bg :foreground everforest-dark4))
     (whitespace-newline                        (:background everforest-bg :foreground everforest-dark4))
     (whitespace-trailing                       (:background everforest-dark1 :foreground everforest-bright_red))
     (whitespace-line                           (:background everforest-dark1 :foreground everforest-bright_red))
     (whitespace-space-before-tab               (:background everforest-bg :foreground everforest-dark4))
     (whitespace-indentation                    (:background everforest-bg :foreground everforest-dark4))
     (whitespace-empty                          (:background nil :foreground nil))
     (whitespace-space-after-tab                (:background everforest-bg :foreground everforest-dark4))

     ;; RainbowDelimiters

     (rainbow-delimiters-depth-1-face           (:foreground everforest-delimiter-one))
     (rainbow-delimiters-depth-2-face           (:foreground everforest-delimiter-two))
     (rainbow-delimiters-depth-3-face           (:foreground everforest-delimiter-three))
     (rainbow-delimiters-depth-4-face           (:foreground everforest-delimiter-four))
     (rainbow-delimiters-depth-5-face           (:foreground everforest-delimiter-one))
     (rainbow-delimiters-depth-6-face           (:foreground everforest-delimiter-two))
     (rainbow-delimiters-depth-7-face           (:foreground everforest-delimiter-three))
     (rainbow-delimiters-depth-8-face           (:foreground everforest-delimiter-four))
     (rainbow-delimiters-depth-9-face           (:foreground everforest-delimiter-one))
     (rainbow-delimiters-depth-10-face          (:foreground everforest-delimiter-two))
     (rainbow-delimiters-depth-11-face          (:foreground everforest-delimiter-three))
     (rainbow-delimiters-depth-12-face          (:foreground everforest-delimiter-four))
     (rainbow-delimiters-unmatched-face         (:background nil :foreground everforest-light0))


     ;; line numbers
     (line-number                               (:foreground everforest-dark4 :background everforest-dark1))
     (line-number-current-line                  (:foreground everforest-bright_orange :background everforest-dark2))
     (linum                                     (:foreground everforest-dark4 :background everforest-dark1))
     (linum-highlight-face                      (:foreground everforest-bright_orange :background everforest-dark2))
     (linum-relative-current-face               (:foreground everforest-bright_orange :background everforest-dark2))

     ;; Highlight indentation mode
     (highlight-indentation-current-column-face (:background everforest-dark2))
     (highlight-indentation-face                (:background everforest-dark1))

     ;; smartparens
     (sp-pair-overlay-face                      (:background everforest-dark2))
     (sp-show-pair-match-face                   (:background everforest-dark2)) ;; Pair tags highlight
     (sp-show-pair-mismatch-face                (:background everforest-bright_red)) ;; Highlight for bracket without pair
     ;;(sp-wrap-overlay-face                     (:inherit 'sp-wrap-overlay-face))
     ;;(sp-wrap-tag-overlay-face                 (:inherit 'sp-wrap-overlay-face))

     ;; elscreen
     (elscreen-tab-background-face              (:background everforest-bg :box nil)) ;; Tab bar, not the tabs
     (elscreen-tab-control-face                 (:background everforest-dark2 :foreground everforest-bright_red :underline nil :box nil)) ;; The controls
     (elscreen-tab-current-screen-face          (:background everforest-dark4 :foreground everforest-dark0 :box nil)) ;; Current tab
     (elscreen-tab-other-screen-face            (:background everforest-dark2 :foreground everforest-light4 :underline nil :box nil)) ;; Inactive tab

     ;; ag (The Silver Searcher)
     (ag-hit-face                               (:foreground everforest-bright_blue))
     (ag-match-face                             (:foreground everforest-bright_red))

     ;; Diffs
     (diff-header                               (:background everforest-dark1))
     (diff-file-header                          (:background everforest-dark2))
     (diff-hunk-header                          (:background everforest-dark2))
     (diff-context                              (:background everforest-dark1 :foreground everforest-light1))
     (diff-added                                (:background nil :foreground everforest-neutral_green))
     (diff-refine-added                         (:background nil :foreground everforest-bright_green))
     (diff-removed                              (:background nil :foreground everforest-neutral_red))
     (diff-refine-removed                       (:background nil :foreground everforest-bright_red))
     (diff-indicator-changed                    (:inherit 'diff-changed))
     (diff-indicator-added                      (:inherit 'diff-added))
     (diff-indicator-removed                    (:inherit 'diff-removed))

     ;; Ediff
     (ediff-even-diff-A                         (:background everforest-dark1))
     (ediff-even-diff-B                         (:background everforest-dark1))
     (ediff-even-diff-C                         (:background everforest-dark1))
     (ediff-even-diff-Ancestor                  (:background everforest-dark1))
     (ediff-odd-diff-A                          (:background everforest-dark2))
     (ediff-odd-diff-B                          (:background everforest-dark2))
     (ediff-odd-diff-C                          (:background everforest-dark2))
     (ediff-odd-diff-Ancestor                   (:background everforest-dark2))

     (ediff-fine-diff-A                         (:background everforest-ediff-fine-diff-A))
     (ediff-fine-diff-Ancestor                  (:background everforest-ediff-fine-diff-Ancestor))
     (ediff-fine-diff-B                         (:background everforest-ediff-fine-diff-B))
     (ediff-fine-diff-C                         (:background everforest-ediff-fine-diff-C))
     (ediff-current-diff-A                      (:background everforest-ediff-current-diff-A))
     (ediff-current-diff-Ancestor               (:background everforest-ediff-current-diff-Ancestor))
     (ediff-current-diff-B                      (:background everforest-ediff-current-diff-B))
     (ediff-current-diff-C                      (:background everforest-ediff-current-diff-C))

     (js2-warning                               (:underline (:color everforest-bright_yellow :style 'wave)))
     (js2-error                                 (:underline (:color everforest-bright_red :style 'wave)))
     (js2-external-variable                     (:underline (:color everforest-bright_aqua :style 'wave)))
     (js2-jsdoc-tag                             (:background nil :foreground everforest-gray  ))
     (js2-jsdoc-type                            (:background nil :foreground everforest-light4))
     (js2-jsdoc-value                           (:background nil :foreground everforest-light3))
     (js2-function-param                        (:background nil :foreground everforest-bright_aqua))
     (js2-function-call                         (:background nil :foreground everforest-bright_blue))
     (js2-instance-member                       (:background nil :foreground everforest-bright_orange))
     (js2-private-member                        (:background nil :foreground everforest-faded_yellow))
     (js2-private-function-call                 (:background nil :foreground everforest-faded_aqua))
     (js2-jsdoc-html-tag-name                   (:background nil :foreground everforest-light4))
     (js2-jsdoc-html-tag-delimiter              (:background nil :foreground everforest-light3))

     ;; popup
     (popup-face                                (:underline nil :foreground everforest-light1 :background everforest-dark1))
     (popup-menu-mouse-face                     (:underline nil :foreground everforest-light0 :background everforest-faded_green))
     (popup-menu-selection-face                 (:underline nil :foreground everforest-light0 :background everforest-faded_green))
     (popup-tip-face                            (:underline nil :foreground everforest-light2 :background everforest-dark2))

     ;; helm
     (helm-M-x-key                              (:foreground everforest-bright_orange ))
     (helm-action                               (:foreground everforest-light0_hard :underline t))
     (helm-bookmark-addressbook                 (:foreground everforest-bright_red))
     (helm-bookmark-directory                   (:foreground everforest-bright_purple))
     (helm-bookmark-file                        (:foreground everforest-faded_blue))
     (helm-bookmark-gnus                        (:foreground everforest-faded_purple))
     (helm-bookmark-info                        (:foreground everforest-turquoise4))
     (helm-bookmark-man                         (:foreground everforest-sienna))
     (helm-bookmark-w3m                         (:foreground everforest-bright_yellow))
     (helm-buffer-directory                     (:foreground everforest-white :background everforest-bright_blue))
     (helm-buffer-not-saved                     (:foreground everforest-faded_red))
     (helm-buffer-process                       (:foreground everforest-burlywood4))
     (helm-buffer-saved-out                     (:foreground everforest-bright_red))
     (helm-buffer-size                          (:foreground everforest-bright_purple))
     (helm-candidate-number                     (:foreground everforest-bright_green))
     (helm-eshell-prompts-buffer-name           (:foreground everforest-bright_green))
     (helm-eshell-prompts-promptidx             (:foreground everforest-turquoise4))
     (helm-ff-directory                         (:foreground everforest-bright_purple))
     (helm-ff-executable                        (:foreground everforest-turquoise4))
     (helm-ff-file                              (:foreground everforest-sienna))
     (helm-ff-invalid-symlink                   (:foreground everforest-white :background everforest-bright_red))
     (helm-ff-prefix                            (:foreground everforest-black :background everforest-bright_yellow))
     (helm-ff-symlink                           (:foreground everforest-bright_orange))
     (helm-grep-cmd-line                        (:foreground everforest-bright_green))
     (helm-grep-file                            (:foreground everforest-faded_purple))
     (helm-grep-finish                          (:foreground everforest-turquoise4))
     (helm-grep-lineno                          (:foreground everforest-bright_orange))
     (helm-grep-match                           (:foreground everforest-bright_yellow))
     (helm-grep-running                         (:foreground everforest-bright_red))
     (helm-header                               (:foreground everforest-aquamarine4))
     (helm-helper                               (:foreground everforest-aquamarine4))
     (helm-history-deleted                      (:foreground everforest-black :background everforest-bright_red))
     (helm-history-remote                       (:foreground everforest-faded_red))
     (helm-lisp-completion-info                 (:foreground everforest-faded_orange))
     (helm-lisp-show-completion                 (:foreground everforest-bright_red))
     (helm-locate-finish                        (:foreground everforest-white :background everforest-aquamarine4))
     (helm-match                                (:foreground everforest-bright_orange))
     (helm-moccur-buffer                        (:foreground everforest-bright_aqua :underline t))
     (helm-prefarg                              (:foreground everforest-turquoise4))
     (helm-selection                            (:foreground everforest-white :background everforest-dark2))
     (helm-selection-line                       (:foreground everforest-white :background everforest-dark2))
     (helm-separator                            (:foreground everforest-faded_red))
     (helm-source-header                        (:foreground everforest-light2))
     (helm-visible-mark                         (:foreground everforest-black :background everforest-light3))

     ;; helm-rg
     (helm-rg-preview-line-highlight              (:foreground everforest-black :background everforest-bright_green))
     (helm-rg-base-rg-cmd-face                    (:foreground everforest-light2))
     (helm-rg-extra-arg-face                      (:foreground everforest-bright_yellow))
     (helm-rg-inactive-arg-face                   (:foreground everforest-faded_aqua))
     (helm-rg-active-arg-face                     (:foreground everforest-bright_green))
     (helm-rg-directory-cmd-face                  (:foreground everforest-burlywood4 :background everforest-black))
     (helm-rg-error-message                       (:foreground everforest-bright_red))
     (helm-rg-title-face                          (:foreground everforest-bright_purple))
     (helm-rg-directory-header-face               (:foreground everforest-white :background everforest-dark1))
     (helm-rg-file-match-face                     (:foreground everforest-turquoise4))
     (helm-rg-colon-separator-ripgrep-output-face (:foreground everforest-dark3 :background everforest-bg))
     (helm-rg-line-number-match-face              (:foreground everforest-faded_orange))
     (helm-rg-match-text-face                     (:foreground everforest-white :background everforest-bright_purple))

     ;; hi-lock-mode
     (hi-black-b                                (:foreground everforest-black :weight 'bold))
     (hi-black-hb                               (:foreground everforest-black :weight 'bold :height 1.5))
     (hi-blue                                   (:foreground everforest-dark0 :background everforest-bright_blue))
     (hi-blue-b                                 (:foreground everforest-bright_blue :weight 'bold))
     (hi-green                                  (:foreground everforest-dark0 :background everforest-bright_green))
     (hi-green-b                                (:foreground everforest-bright_green :weight 'bold))
     (hi-pink                                   (:foreground everforest-dark0 :background everforest-bright_purple))
     (hi-red-b                                  (:foreground everforest-bright_red :weight 'bold))
     (hi-yellow                                 (:foreground everforest-dark0 :background everforest-faded_yellow))

     ;; company-mode
     (company-scrollbar-bg                      (:background everforest-dark2))
     (company-scrollbar-fg                      (:background everforest-dark1))
     (company-tooltip                           (:background everforest-dark1))
     (company-tooltip-annotation                (:foreground everforest-bright_green))
     (company-tooltip-annotation-selection      (:inherit 'company-tooltip-annotation))
     (company-tooltip-selection                 (:foreground everforest-bright_purple :background everforest-dark2))
     (company-tooltip-common                    (:foreground everforest-bright_blue :underline t))
     (company-tooltip-common-selection          (:foreground everforest-bright_blue :underline t))
     (company-preview-common                    (:foreground everforest-light0))
     (company-preview                           (:background everforest-lightblue4))
     (company-preview-search                    (:background everforest-turquoise4))
     (company-template-field                    (:foreground everforest-black :background everforest-bright_yellow))
     (company-echo-common                       (:foreground everforest-faded_red))

     ;; tool tips
     (tooltip                                   (:foreground everforest-light1 :background everforest-dark1))

     ;; marginalia
     (marginalia-documentation                  (:italic t :foreground everforest-light3))
     
     ;; corfu
     (corfu-background                          (:background everforest-dark1))
     (corfu-current                             (:foreground everforest-bright_purple :background everforest-dark2))
     (corfu-bar                                 (:background everforest-dark2))
     (corfu-border                              (:background everforest-dark1))

     ;; term
     (term-color-black                          (:foreground everforest-dark2 :background everforest-dark1))
     (term-color-blue                           (:foreground everforest-bright_blue :background everforest-bright_blue))
     (term-color-cyan                           (:foreground everforest-bright_aqua :background everforest-bright_aqua))
     (term-color-green                          (:foreground everforest-bright_green :background everforest-bright_green))
     (term-color-magenta                        (:foreground everforest-bright_purple :background everforest-bright_purple))
     (term-color-red                            (:foreground everforest-bright_red :background everforest-bright_red))
     (term-color-white                          (:foreground everforest-light1 :background everforest-light1))
     (term-color-yellow                         (:foreground everforest-bright_yellow :background everforest-bright_yellow))
     (term-default-fg-color                     (:foreground everforest-light0))
     (term-default-bg-color                     (:background everforest-bg))

     ;; message-mode
     (message-header-to                         (:inherit 'font-lock-variable-name-face))
     (message-header-cc                         (:inherit 'font-lock-variable-name-face))
     (message-header-subject                    (:foreground everforest-bright_orange :weight 'bold))
     (message-header-newsgroups                 (:foreground everforest-bright_yellow :weight 'bold))
     (message-header-other                      (:inherit 'font-lock-variable-name-face))
     (message-header-name                       (:inherit 'font-lock-keyword-face))
     (message-header-xheader                    (:foreground everforest-faded_blue))
     (message-separator                         (:inherit 'font-lock-comment-face))
     (message-cited-text                        (:inherit 'font-lock-comment-face))
     (message-mml                               (:foreground everforest-faded_green :weight 'bold))

     ;; org-mode
     (org-hide                                  (:foreground everforest-dark0))
     (org-level-1                               (:foreground everforest-bright_blue))
     (org-level-2                               (:foreground everforest-bright_yellow))
     (org-level-3                               (:foreground everforest-bright_purple))
     (org-level-4                               (:foreground everforest-bright_red))
     (org-level-5                               (:foreground everforest-bright_green))
     (org-level-6                               (:foreground everforest-bright_aqua))
     (org-level-7                               (:foreground everforest-faded_blue))
     (org-level-8                               (:foreground everforest-bright_orange))
     (org-special-keyword                       (:inherit 'font-lock-comment-face))
     (org-drawer                                (:inherit 'font-lock-function-name-face))
     (org-column                                (:background everforest-dark0))
     (org-column-title                          (:background everforest-dark0 :underline t :weight 'bold))
     (org-warning                               (:foreground everforest-bright_red :weight 'bold :underline nil :bold t))
     (org-archived                              (:foreground everforest-light0 :weight 'bold))
     (org-link                                  (:foreground everforest-faded_aqua :underline t))
     (org-footnote                              (:foreground everforest-bright_aqua :underline t))
     (org-ellipsis                              (:foreground everforest-light4))
     (org-date                                  (:foreground everforest-bright_blue :underline t))
     (org-sexp-date                             (:foreground everforest-faded_blue :underline t))
     (org-tag                                   (:bold t :weight 'bold))
     (org-list-dt                               (:bold t :weight 'bold))
     (org-todo                                  (:foreground everforest-bright_red :weight 'bold :bold t))
     (org-done                                  (:foreground everforest-bright_aqua :weight 'bold :bold t))
     (org-agenda-done                           (:foreground everforest-bright_aqua))
     (org-headline-done                         (:foreground everforest-bright_aqua))
     (org-table                                 (:foreground everforest-bright_blue))
     (org-block                                 (:background everforest-dark0_soft))
     (org-block-begin-line                      (:background everforest-dark1))
     (org-block-end-line                        (:background everforest-dark1))
     (org-formula                               (:foreground everforest-bright_yellow))
     (org-document-title                        (:foreground everforest-faded_blue))
     (org-document-info                         (:foreground everforest-faded_blue))
     (org-agenda-structure                      (:inherit 'font-lock-comment-face))
     (org-agenda-date-today                     (:foreground everforest-light0 :weight 'bold :italic t))
     (org-scheduled                             (:foreground everforest-bright_yellow))
     (org-scheduled-today                       (:foreground everforest-bright_blue))
     (org-scheduled-previously                  (:foreground everforest-faded_red))
     (org-upcoming-deadline                     (:inherit 'font-lock-keyword-face))
     (org-deadline-announce                     (:foreground everforest-faded_red))
     (org-time-grid                             (:foreground everforest-faded_orange))
     (org-latex-and-related                     (:foreground everforest-bright_blue))

     ;; org-habit
     (org-habit-clear-face                      (:background everforest-faded_blue))
     (org-habit-clear-future-face               (:background everforest-bright_blue))
     (org-habit-ready-face                      (:background everforest-faded_green))
     (org-habit-ready-future-face               (:background everforest-bright_green))
     (org-habit-alert-face                      (:background everforest-faded_yellow))
     (org-habit-alert-future-face               (:background everforest-bright_yellow))
     (org-habit-overdue-face                    (:background everforest-faded_red))
     (org-habit-overdue-future-face             (:background everforest-bright_red))

     ;; elfeed
     (elfeed-search-title-face                  (:foreground everforest-gray  ))
     (elfeed-search-unread-title-face           (:foreground everforest-light0))
     (elfeed-search-date-face                   (:inherit 'font-lock-builtin-face :underline t))
     (elfeed-search-feed-face                   (:inherit 'font-lock-variable-name-face))
     (elfeed-search-tag-face                    (:inherit 'font-lock-keyword-face))
     (elfeed-search-last-update-face            (:inherit 'font-lock-comment-face))
     (elfeed-search-unread-count-face           (:inherit 'font-lock-comment-face))
     (elfeed-search-filter-face                 (:inherit 'font-lock-string-face))

     ;; smart-mode-line
     (sml/global                                (:foreground everforest-light4 :inverse-video nil))
     (sml/modes                                 (:foreground everforest-bright_green))
     (sml/filename                              (:foreground everforest-bright_red :weight 'bold))
     (sml/prefix                                (:foreground everforest-light1))
     (sml/read-only                             (:foreground everforest-bright_blue))
     (persp-selected-face                       (:foreground everforest-bright_orange))

     ;; powerline
     (powerline-active0                         (:background everforest-dark4 :foreground everforest-light0))
     (powerline-active1                         (:background everforest-dark3 :foreground everforest-light0))
     (powerline-active2                         (:background everforest-dark2 :foreground everforest-light0))
     (powerline-inactive0                       (:background everforest-dark2 :foreground everforest-light4))
     (powerline-inactive1                       (:background everforest-dark1 :foreground everforest-light4))
     (powerline-inactive2                       (:background everforest-dark0 :foreground everforest-light4))

     ;; isearch
     (isearch                                   (:foreground everforest-black :background everforest-bright_orange))
     (lazy-highlight                            (:foreground everforest-black :background everforest-bright_yellow))
     (isearch-fail                              (:foreground everforest-light0 :background everforest-bright_red))

     ;; markdown-mode
     (markdown-header-face-1                    (:foreground everforest-bright_blue))
     (markdown-header-face-2                    (:foreground everforest-bright_yellow))
     (markdown-header-face-3                    (:foreground everforest-bright_purple))
     (markdown-header-face-4                    (:foreground everforest-bright_red))
     (markdown-header-face-5                    (:foreground everforest-bright_green))
     (markdown-header-face-6                    (:foreground everforest-bright_aqua))

     ;; anzu-mode
     (anzu-mode-line                            (:foreground everforest-bright_yellow :weight 'bold))
     (anzu-match-1                              (:background everforest-bright_green))
     (anzu-match-2                              (:background everforest-faded_yellow))
     (anzu-match-3                              (:background everforest-aquamarine4))
     (anzu-replace-to                           (:foreground everforest-bright_yellow))
     (anzu-replace-highlight                    (:inherit 'isearch))

     ;; ace-jump-mode
     (ace-jump-face-background                  (:foreground everforest-light4 :background everforest-bg :inverse-video nil))
     (ace-jump-face-foreground                  (:foreground everforest-bright_red :background everforest-bg :inverse-video nil))

     ;; ace-window
     (aw-background-face                        (:foreground everforest-light1 :background everforest-bg :inverse-video nil))
     (aw-leading-char-face                      (:foreground everforest-bright_red :background everforest-bg :height 4.0))

     ;; show-paren
     (show-paren-match                          (:background everforest-dark3 :foreground everforest-bright_blue  :weight 'bold))
     (show-paren-mismatch                       (:background everforest-bright_red :foreground everforest-dark3 :weight 'bold))

     ;; ivy
     (ivy-current-match                         (:foreground everforest-light0_hard :weight 'bold :underline t))
     (ivy-minibuffer-match-face-1               (:foreground everforest-bright_orange))
     (ivy-minibuffer-match-face-2               (:foreground everforest-bright_yellow))
     (ivy-minibuffer-match-face-3               (:foreground everforest-faded_orange))
     (ivy-minibuffer-match-face-4               (:foreground everforest-faded_yellow))

     ;; ido
     (ido-only-match                            (:inherit 'success))
     (ido-first-match                           (:foreground everforest-light0_hard :weight 'bold :underline t))
     (ido-subdir                                (:inherit 'dired-directory))

     ;; magit
     (magit-bisect-bad                          (:foreground everforest-faded_red))
     (magit-bisect-good                         (:foreground everforest-faded_green))
     (magit-bisect-skip                         (:foreground everforest-faded_yellow))
     (magit-blame-heading                       (:foreground everforest-light0 :background everforest-dark2))
     (magit-branch-local                        (:foreground everforest-bright_blue))
     (magit-branch-current                      (:underline everforest-bright_blue :inherit 'magit-branch-local))
     (magit-branch-remote                       (:foreground everforest-bright_green))
     (magit-cherry-equivalent                   (:foreground everforest-bright_purple))
     (magit-cherry-unmatched                    (:foreground everforest-bright_aqua))
     (magit-diff-added                          (:foreground everforest-bright_green))
     (magit-diff-added-highlight                (:foreground everforest-bright_green :inherit 'magit-diff-context-highlight))
     (magit-diff-base                           (:background everforest-faded_yellow :foreground everforest-light2))
     (magit-diff-base-highlight                 (:background everforest-faded_yellow :foreground everforest-light0))
     (magit-diff-context                        (:foreground everforest-dark1  :foreground everforest-light1))
     (magit-diff-context-highlight              (:background everforest-dark1 :foreground everforest-light0))
     (magit-diff-hunk-heading                   (:background everforest-dark3 :foreground everforest-light2))
     (magit-diff-hunk-heading-highlight         (:background everforest-dark2 :foreground everforest-light0))
     (magit-diff-hunk-heading-selection         (:background everforest-dark2 :foreground everforest-bright_orange))
     (magit-diff-lines-heading                  (:background everforest-faded_orange :foreground everforest-light0))
     (magit-diff-removed                        (:foreground everforest-bright_red))
     (magit-diff-removed-highlight              (:foreground everforest-bright_red :inherit 'magit-diff-context-highlight))
     (magit-diffstat-added                      (:foreground everforest-faded_green))
     (magit-diffstat-removed                    (:foreground everforest-faded_red))
     (magit-dimmed                              (:foreground everforest-dark4))
     (magit-hash                                (:foreground everforest-bright_blue))
     (magit-log-author                          (:foreground everforest-bright_red))
     (magit-log-date                            (:foreground everforest-bright_aqua))
     (magit-log-graph                           (:foreground everforest-dark4))
     (magit-process-ng                          (:foreground everforest-bright_red :weight 'bold))
     (magit-process-ok                          (:foreground everforest-bright_green :weight 'bold))
     (magit-reflog-amend                        (:foreground everforest-bright_purple))
     (magit-reflog-checkout                     (:foreground everforest-bright_blue))
     (magit-reflog-cherry-pick                  (:foreground everforest-bright_green))
     (magit-reflog-commit                       (:foreground everforest-bright_green))
     (magit-reflog-merge                        (:foreground everforest-bright_green))
     (magit-reflog-other                        (:foreground everforest-bright_aqua))
     (magit-reflog-rebase                       (:foreground everforest-bright_purple))
     (magit-reflog-remote                       (:foreground everforest-bright_blue))
     (magit-reflog-reset                        (:foreground everforest-bright_red))
     (magit-refname                             (:foreground everforest-light4))
     (magit-section-heading                     (:foreground everforest-bright_yellow :weight 'bold))
     (magit-section-heading-selection           (:foreground everforest-faded_yellow))
     (magit-section-highlight                   (:background everforest-dark1))
     (magit-sequence-drop                       (:foreground everforest-faded_yellow))
     (magit-sequence-head                       (:foreground everforest-bright_aqua))
     (magit-sequence-part                       (:foreground everforest-bright_yellow))
     (magit-sequence-stop                       (:foreground everforest-bright_green))
     (magit-signature-bad                       (:foreground everforest-bright_red :weight 'bold))
     (magit-signature-error                     (:foreground everforest-bright_red))
     (magit-signature-expired                   (:foreground everforest-bright_orange))
     (magit-signature-good                      (:foreground everforest-bright_green))
     (magit-signature-revoked                   (:foreground everforest-bright_purple))
     (magit-signature-untrusted                 (:foreground everforest-bright_blue))
     (magit-tag                                 (:foreground everforest-bright_yellow))

     ;; cider
     (cider-debug-code-overlay-face             (:background everforest-dark2 :foreground everforest-light0))
     (cider-deprecated-face                     (:background everforest-dark2 :foreground everforest-bright_orange))
     (cider-enlightened-local-face              (:foreground everforest-bright_orange :weight 'bold))
     (cider-error-highlight-face                (:foreground everforest-bright_red :underline t :style 'wave))
     (cider-fringe-good-face                    (:foreground everforest-neutral_green))
     (cider-instrumented-face                   (:background everforest-dark1 :box (:line-width -1 :color everforest-bright_red)))
     (cider-result-overlay-face                 (:background everforest-dark2 :box (:line-width -1 :color everforest-bright_yellow)))
     (cider-test-error-face                     (:background everforest-faded_red))
     (cider-test-error-face                     (:background everforest-neutral_orange))
     (cider-test-success-face                   (:background everforest-bright_green))
     (cider-traced                              (:background everforest-bright_aqua))
     (cider-warning-highlight-face              (:foreground everforest-bright_yellow :underline t :style 'wave))

     ;; git-gutter
     (git-gutter:modified                       (:background everforest-faded_blue :foreground everforest-faded_blue))
     (git-gutter:added                          (:background everforest-faded_green :foreground everforest-faded_green))
     (git-gutter:deleted                        (:background everforest-faded_red :foreground everforest-faded_red))

     ;; git-gutter+
     (git-gutter+-modified                      (:foreground everforest-faded_blue :background everforest-faded_blue))
     (git-gutter+-added                         (:foreground everforest-faded_green :background everforest-faded_green))
     (git-gutter+-deleted                       (:foreground everforest-faded_red :background everforest-faded_red))

     ;; git-gutter-fringe
     (git-gutter-fr:modified                    (:inherit 'git-gutter:modified))
     (git-gutter-fr:added                       (:inherit 'git-gutter:added))
     (git-gutter-fr:deleted                     (:inherit 'git-gutter:deleted))

     ;; diff-hl
     (diff-hl-change (:background everforest-faded_blue :foreground everforest-faded_blue))
     (diff-hl-delete (:background everforest-faded_red :foreground everforest-faded_red))
     (diff-hl-insert (:background everforest-faded_green :foreground everforest-faded_green))

     ;; flyspell
     (flyspell-duplicate                        (:underline (:color everforest-light4 :style 'line)))
     (flyspell-incorrect                        (:underline (:color everforest-bright_red :style 'line)))

     ;; langtool
     (langtool-errline                          (:foreground everforest-dark0 :background everforest-bright_red))
     (langtool-correction-face                  (:foreground everforest-bright_yellow :weight 'bold))

     ;; latex
     (font-latex-bold-face                      (:foreground everforest-faded_green :bold t))
     (font-latex-italic-face                    (:foreground everforest-bright_green :underline t))
     (font-latex-math-face                      (:foreground everforest-light3))
     (font-latex-script-char-face               (:foreground everforest-faded_aqua))
     (font-latex-sectioning-5-face              (:foreground everforest-bright_yellow :bold t))
     (font-latex-sedate-face                    (:foreground everforest-light4))
     (font-latex-string-face                    (:foreground everforest-bright_orange))
     (font-latex-verbatim-face                  (:foreground everforest-light4))
     (font-latex-warning-face                   (:foreground everforest-bright_red :weight 'bold))
     (preview-face                              (:background everforest-dark1))

     ;; lsp
     (lsp-lsp-flycheck-warning-unnecessary-face (:underline (:color everforest-bright_orange :style 'wave)
                                                            :foreground everforest-burlywood4))
     (lsp-ui-doc-background                     (:background everforest-dark3))
     (lsp-ui-doc-header                         (:background everforest-faded_blue))
     (lsp-ui-peek-filename                      (:foreground everforest-bright_red))
     (lsp-ui-sideline-code-action               (:foreground everforest-bright_yellow))
     (lsp-ui-sideline-current-symbol            (:foreground everforest-faded_aqua))
     (lsp-ui-sideline-symbol                    (:foreground everforest-gray))

     ;; mu4e
     (mu4e-header-key-face                      (:foreground everforest-bright_green :weight 'bold ))
     (mu4e-unread-face                          (:foreground everforest-bright_blue :weight 'bold ))
     (mu4e-highlight-face                       (:foreground everforest-bright_green))

     ;; shell script
     (sh-quoted-exec                            (:foreground everforest-bright_purple))
     (sh-heredoc                                (:foreground everforest-bright_orange))

     ;; undo-tree
     (undo-tree-visualizer-active-branch-face   (:foreground everforest-light0))
     (undo-tree-visualizer-current-face         (:foreground everforest-bright_red))
     (undo-tree-visualizer-default-face         (:foreground everforest-dark4))
     (undo-tree-visualizer-register-face        (:foreground everforest-bright_yellow))
     (undo-tree-visualizer-unmodified-face      (:foreground everforest-bright_aqua))

     ;; widget faces
     (widget-button-pressed-face                (:foreground everforest-bright_red))
     (widget-documentation-face                 (:foreground everforest-faded_green))
     (widget-field                              (:foreground everforest-light0 :background everforest-dark2))
     (widget-single-line-field                  (:foreground everforest-light0 :background everforest-dark2))

     ;; dired+
     (diredp-file-name                          (:foreground everforest-light2))
     (diredp-file-suffix                        (:foreground everforest-light4))
     (diredp-compressed-file-suffix             (:foreground everforest-faded_blue))
     (diredp-dir-name                           (:foreground everforest-faded_blue))
     (diredp-dir-heading                        (:foreground everforest-bright_blue))
     (diredp-symlink                            (:foreground everforest-bright_orange))
     (diredp-date-time                          (:foreground everforest-light3))
     (diredp-number                             (:foreground everforest-faded_blue))
     (diredp-no-priv                            (:foreground everforest-dark4))
     (diredp-other-priv                         (:foreground everforest-dark2))
     (diredp-rare-priv                          (:foreground everforest-dark4))
     (diredp-ignored-file-name                  (:foreground everforest-dark4))

     (diredp-dir-priv                           (:foreground everforest-faded_blue  :background everforest-dark_blue))
     (diredp-exec-priv                          (:foreground everforest-faded_blue  :background everforest-dark_blue))
     (diredp-link-priv                          (:foreground everforest-faded_aqua  :background everforest-dark_aqua))
     (diredp-read-priv                          (:foreground everforest-bright_red  :background everforest-dark_red))
     (diredp-write-priv                         (:foreground everforest-bright_aqua :background everforest-dark_aqua))

     ;; diredfl
     (diredfl-autofile-name                     (:foreground everforest-light2))
     (diredfl-compressed-file-name              (:foreground everforest-light2))
     (diredfl-compressed-file-suffix            (:foreground everforest-faded_blue))
     (diredfl-date-time                         (:foreground everforest-bright_aqua))
     (diredfl-deletion                          (:foreground everforest-bright_red :bold t))
     (diredfl-deletion-file-name                (:foreground everforest-bright_red :bold t))
     (diredfl-dir-heading                       (:foreground everforest-bright_blue :bold t))
     (diredfl-dir-name                          (:foreground everforest-bright_blue))
     (diredfl-dir-priv                          (:foreground everforest-bright_blue :background everforest-dark_blue))
     (diredfl-exec-priv                         (:foreground everforest-bright_blue :background everforest-dark_blue))
     (diredfl-executable-tag                    (:foreground everforest-bright_green))
     (diredfl-file-name                         (:foreground everforest-light2))
     (diredfl-file-suffix                       (:foreground everforest-light4))
     (diredfl-symlink                           (:foreground everforest-bright_purple))
     (diredfl-flag-mark                         (:foreground everforest-bright_yellow :background everforest-dark3))
     (diredfl-flag-mark-line                    (:foreground everforest-bright_yellow :background everforest-dark2))
     (diredfl-ignored-file-name                 (:foreground everforest-dark4))
     (diredfl-link-priv                         (:foreground everforest-faded_purple))
     (diredfl-no-priv                           (:foreground everforest-light2))
     (diredfl-number                            (:foreground everforest-bright_yellow))
     (diredfl-other-priv                        (:foreground everforest-bright_purple))
     (diredfl-rare-priv                         (:foreground everforest-light2))
     (diredfl-read-priv                         (:foreground everforest-bright_yellow))
     (diredfl-write-priv                        (:foreground everforest-bright_red))
     (diredfl-tagged-autofile-name              (:foreground everforest-light4))

     ;; neotree
     (neo-banner-face                           (:foreground everforest-bright_purple :bold t))
     (neo-dir-link-face                         (:foreground everforest-bright_yellow))
     (neo-expand-btn-face                       (:foreground everforest-bright_orange))
     (neo-file-link-face                        (:foreground everforest-light0))
     (neo-header-face                           (:foreground everforest-bright_purple))
     (neo-root-dir-face                         (:foreground everforest-bright_purple :bold t))

     ;; eshell
     (eshell-prompt                              (:foreground everforest-bright_aqua))
     (eshell-ls-archive                          (:foreground everforest-light3))
     (eshell-ls-backup                           (:foreground everforest-light4))
     (eshell-ls-clutter                          (:foreground everforest-bright_orange :weight 'bold))
     (eshell-ls-directory                        (:foreground everforest-bright_yellow))
     (eshell-ls-executable                       (:weight 'bold))
     (eshell-ls-missing                          (:foreground everforest-bright_red :bold t))
     (eshell-ls-product                          (:foreground everforest-faded_red))
     (eshell-ls-readonly                         (:foreground everforest-light2))
     (eshell-ls-special                          (:foreground everforest-bright_yellow :bold t))
     (eshell-ls-symlink                          (:foreground everforest-bright_red))
     (eshell-ls-unreadable                       (:foreground everforest-bright_red :bold t))

     ;; tabbar
     (tabbar-default                             (:foreground everforest-light0 :background everforest-dark3 :bold nil :height 1.0 :box (:line-width -5 :color everforest-dark3)))
     (tabbar-separator                           (:foreground everforest-light0 :background everforest-dark3))
     (tabbar-highlight                           (:inherit 'highlight))
     (tabbar-button                              (:foreground everforest-dark3 :background everforest-dark3 :box nil :line-width 0))
     (tabbar-button-highlight                    (:inherit 'tabbar-button :inverse-video t))
     (tabbar-modified                            (:foreground everforest-bright_green :background everforest-dark3 :box (:line-width -5 :color everforest-dark3)))
     (tabbar-unselected                          (:inherit 'tabbar-default))
     (tabbar-unselected-modified                 (:inherit 'tabbar-modified))
     (tabbar-selected                            (:inherit 'tabbar-default :foreground everforest-bright_yellow))
     (tabbar-selected-modified                   (:inherit 'tabbar-selected))

     ;; wgrep
     (wgrep-delete-face                          (:strike-through everforest-bright_red))
     (wgrep-done-face                            (:foreground everforest-turquoise4))
     (wgrep-face                                 (:underline (:color everforest-bright_yellow :style 'line)))
     (wgrep-file-face                            (:inherit 'highlight))
     (wgrep-reject-face                          (:foreground everforest-bright_red :bold t))

     ;; hydra
     (hydra-face-red (:foreground everforest-bright_red :weight 'bold))
     (hydra-face-blue (:foreground everforest-bright_blue :weight 'bold))
     (hydra-face-amaranth (:foreground everforest-bright_yellow :weight 'bold))
     (hydra-face-pink (:foreground everforest-bright_purple :weight 'bold))
     (hydra-face-teal (:foreground everforest-bright_aqua :weight 'bold))

     ;; which-function-mode
     (which-func                                 (:foreground everforest-faded_blue))

     ;; auto-dim-other-buffers
     (auto-dim-other-buffers-face                (:background everforest-bg_inactive))

     ;; flycheck
     (flycheck-warning                          (:underline (:style 'wave :color everforest-bright_yellow)))
     (flycheck-error                            (:underline (:style 'wave :color everforest-bright_red)))
     (flycheck-info                             (:underline (:style 'wave :color everforest-bright_blue)))
     (flycheck-fringe-warning                   (:foreground everforest-bright_yellow))
     (flycheck-fringe-error                     (:foreground everforest-bright_red))
     (flycheck-fringe-info                      (:foreground everforest-bright_blue))
     (flycheck-error-list-warning               (:foreground everforest-bright_yellow :bold t))
     (flycheck-error-list-error                 (:foreground everforest-bright_red :bold t))
     (flycheck-error-list-info                  (:foreground everforest-bright_blue :bold t))

     ;; tab-bar
     (tab-bar-tab-inactive (:background everforest-bg :foreground everforest-light0))
     (tab-bar-tab (:background everforest-dark2 :foreground everforest-light0))
     (tab-bar (:background everforest-bg :foreground everforest-light0))

     ;; circe
     (circe-prompt-face               (:foreground everforest-turquoise4))
     (circe-fool                      (:foreground everforest-dark2))
     (circe-highlight-nick-face       (:foreground everforest-bright_yellow))
     (circe-server-face               (:foreground everforest-dark4))
     (circe-my-message-face           (:foreground everforest-bright_aqua))
     (lui-time-stamp-face             (:foreground everforest-bright_blue))

     ;; erc
     (erc-action-face            (:inherit 'erc-default-face))
     (erc-bold-face              (:weight 'bold))
     (erc-current-nick-face      (:foreground everforest-aquamarine4))
     (erc-dangerous-host-face    (:inherit 'font-lock-warning-face))
     (erc-default-face           (:inherit 'default))
     (erc-direct-msg-face        (:inherit 'erc-default-face))
     (erc-error-face             (:inherit 'font-lock-warning-face))
     (erc-fool-face              (:inherit 'erc-default-face))
     (erc-input-face             (:foreground everforest-turquoise4))
     (erc-my-nick-face           (:foreground everforest-turquoise4))
     (erc-nick-msg-face          (:inherit 'erc-default-face))
     (erc-notice-face            (:foreground everforest-dark4))
     (erc-timestamp-face         (:foreground everforest-neutral_green))
     (erc-underline-face         (:underline t))
     (erc-prompt-face            (:foreground everforest-turquoise4))
     (erc-pal-face               (:foreground everforest-neutral_yellow :weight 'bold))
     (erc-keyword-face           (:foreground everforest-bright_orange :weight 'bold))
     (erc-nick-default-face      (:weight 'regular))
     (erc-button                 (:weight 'bold  :underline t))

     ;; gnus
     (gnus-group-mail-1           (:weight 'bold :foreground everforest-light0))
     (gnus-group-mail-2           (:inherit 'gnus-group-mail-1))
     (gnus-group-mail-3           (:inherit 'gnus-group-mail-1))
     (gnus-group-mail-1-empty     (:foreground everforest-dark4))
     (gnus-group-mail-2-empty     (:inherit 'gnus-group-mail-1-empty))
     (gnus-group-mail-3-empty     (:inherit 'gnus-group-mail-1-empty))
     (gnus-group-news-1           (:inherit 'gnus-group-mail-1))
     (gnus-group-news-2           (:inherit 'gnus-group-news-1))
     (gnus-group-news-3           (:inherit 'gnus-group-news-1))
     (gnus-group-news-4           (:inherit 'gnus-group-news-1))
     (gnus-group-news-5           (:inherit 'gnus-group-news-1))
     (gnus-group-news-6           (:inherit 'gnus-group-news-1))
     (gnus-group-news-1-empty     (:inherit 'gnus-group-mail-1-empty))
     (gnus-group-news-2-empty     (:inherit 'gnus-group-news-1-empty))
     (gnus-group-news-3-empty     (:inherit 'gnus-group-news-1-empty))
     (gnus-group-news-4-empty     (:inherit 'gnus-group-news-1-empty))
     (gnus-group-news-5-empty     (:inherit 'gnus-group-news-1-empty))
     (gnus-group-news-6-empty     (:inherit 'gnus-group-news-1-empty))
     (gnus-group-mail-low         (:inherit 'gnus-group-mail-1 :weight 'normal))
     (gnus-group-mail-low-empty   (:inherit 'gnus-group-mail-1-empty))
     (gnus-group-news-low         (:inherit 'gnus-group-mail-1 :foreground everforest-dark4))
     (gnus-group-news-low-empty   (:inherit 'gnus-group-news-low :weight 'normal))
     (gnus-header-content         (:inherit 'message-header-other))
     (gnus-header-from            (:inherit 'message-header-other))
     (gnus-header-name            (:inherit 'message-header-name))
     (gnus-header-newsgroups      (:inherit 'message-header-other))
     (gnus-header-subject         (:inherit 'message-header-subject))
     (gnus-summary-cancelled      (:foreground everforest-bright_red :strike-through t))
     (gnus-summary-normal-ancient (:foreground everforest-dark4 :inherit 'italic))
     (gnus-summary-normal-read    (:foreground everforest-light0))
     (gnus-summary-normal-ticked  (:foreground everforest-bright_purple))
     (gnus-summary-normal-unread  (:foreground everforest-bright_green :inherit 'bold))
     (gnus-summary-selected       (:foreground everforest-bright_blue :weight 'bold))
     (gnus-cite-1                 (:foreground everforest-bright_purple))
     (gnus-cite-2                 (:foreground everforest-bright_purple))
     (gnus-cite-3                 (:foreground everforest-bright_purple))
     (gnus-cite-4                 (:foreground everforest-bright_green))
     (gnus-cite-5                 (:foreground everforest-bright_green))
     (gnus-cite-6                 (:foreground everforest-bright_green))
     (gnus-cite-7                 (:foreground everforest-bright_purple))
     (gnus-cite-8                 (:foreground everforest-bright_purple))
     (gnus-cite-9                 (:foreground everforest-bright_purple))
     (gnus-cite-10                (:foreground everforest-faded_orange))
     (gnus-cite-11                (:foreground everforest-faded_orange))
     (gnus-signature              (:foreground everforest-faded_orange))
     (gnus-x-face                 (:background everforest-dark4 :foreground everforest-light0))

     ;; web-mode
     (web-mode-doctype-face          (:foreground everforest-bright_blue))
     (web-mode-html-tag-bracket-face (:foreground everforest-bright_blue))
     (web-mode-html-tag-face         (:foreground everforest-bright_blue))
     (web-mode-html-attr-name-face   (:foreground everforest-bright_yellow))
     (web-mode-html-attr-equal-face  (:foreground everforest-bright_yellow))
     (web-mode-html-attr-value-face  (:foreground everforest-bright_green))

     ;; Coq
     (coq-solve-tactics-face      (:inherit 'font-lock-constant-face))
     (coq-cheat-face              (:box (:line-width -1 :color everforest-bright_red :style nil)
                                        :foreground everforest-bright_red))

     ;; Proof General
     (proof-active-area-face      (:underline t))
     (proof-tacticals-name-face   (:inherit 'font-lock-constant-face))
     (proof-tactics-name-face     (:inherit 'font-lock-constant-face))

     ;; ledger-mode
     (ledger-font-xact-highlight-face  (:background everforest-dark1))

     ),@body))

(provide 'everforest)

;; Local Variables:
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; everforest-dark-theme.el ends here
