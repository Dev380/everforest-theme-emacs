;;; everforest-dark-medium-theme.el --- A retro-groove colour theme for Emacs -*- lexical-binding: t -*-

;; Copyright (c) 2013 Lee Machin
;; Copyright (c) 2013-2016 Eduardo Lavaque
;; Copyright (c) 2016-2017 Jason Milkins
;; Copyright (c) 2017-2018 Martijn Terpstra

;; Author: Jason Milkins <jasonm23@gmail.com>
;; (current maintainer)
;;
;; Author-list: Lee Machin <ljmachin@gmail.com>,
;;              Eduardo Lavaque <me@greduan.com>
;;
;; URL: http://github.com/greduan/emacs-theme-everforest
;; Version: 1.26.0

;; Package-Requires: ((autothemer "0.2"))

;;; Commentary:

;; Using autothemer since 1.00

;; A port of the Everforest colorscheme for Vim, built on top of the new built-in
;; theme support in Emacs 24.
;;
;; This theme contains my own modifications and it's a bit opinionated
;; sometimes, deviating from the original because of it. I try to stay
;; true to the original as much as possible, however. I only make
;; changes where I would have made the changes on the original.
;;
;; Since there is no direct equivalent in syntax highlighting from Vim to Emacs
;; some stuff may look different, especially in stuff like JS2-mode, where it
;; adds stuff that Vim doesn't have, in terms of syntax.

;;; Credits:

;; Pavel Pertsev created the original theme for Vim, on which this port
;; is based.

;; Lee Machin created the first port of the original theme, which
;; Greduan developed further adding support for several major modes.
;;
;; Jason Milkins (ocodo) has maintained the theme since 2015 and is
;; working with the community to add further mode support and align
;; the project more closely with Vim Everforest.

;;; Code:
(eval-when-compile
  (require 'cl-lib))

(require 'everforest)

(everforest-deftheme
 everforest-dark-medium
 "A retro-groove colour theme (dark version, medium contrast)"

 ((((class color) (min-colors #xFFFFFF))        ; col 1 GUI/24bit
   ((class color) (min-colors #xFF)))           ; col 2 Xterm/256

  (everforest-dark0_hard      "#2b3339" "#1c1c1c")
  (everforest-dark0           "#2f383e" "#262626")
  (everforest-dark0_soft      "#323d43" "#303030")
  (everforest-dark1           "#374247" "#3a3a3a")
  (everforest-dark2           "#404c51" "#4e4e4e")
  (everforest-dark3           "#4a555b" "#626262")
  (everforest-dark4           "#525c62" "#767676")

  (everforest-gray            "#7a8478" "#8a8a8a")

  (everforest-light0_hard     "#f8f0dc" "#ffffd7")
  (everforest-light0          "#f8f0dc" "#ffffaf")
  (everforest-light1          "#efead4" "#ffdfaf")
  (everforest-light2          "#e9e5cf" "#bcbcbc")
  (everforest-light3          "#e1ddc9" "#a8a8a8")
  (everforest-light4          "#dcd8c4" "#949494")

  (everforest-bright_red      "#e67e80" "#d75f5f")
  (everforest-bright_green    "#a7c080" "#afaf00")
  (everforest-bright_yellow   "#dbbc7f" "#ffaf00")
  (everforest-bright_blue     "#7fbbb3" "#87afaf")
  (everforest-bright_purple   "#d699b6" "#d787af")
  (everforest-bright_aqua     "#83c092" "#87af87")
  (everforest-bright_orange   "#e69875" "#ff8700")

  (everforest-neutral_red      "#e67e80" "#d75f5f")
  (everforest-neutral_green    "#a7c080" "#afaf00")
  (everforest-neutral_yellow   "#dbbc7f" "#ffaf00")
  (everforest-neutral_blue     "#7fbbb3" "#87afaf")
  (everforest-neutral_purple   "#d699b6" "#d787af")
  (everforest-neutral_aqua     "#83c092" "#87af87")
  (everforest-neutral_orange   "#e69875" "#ff8700")

  (everforest-faded_red       "#b7596a" "#d75f5f")
  (everforest-faded_green     "#879c74" "#afaf00")
  (everforest-faded_yellow    "#b89871" "#ffaf00")
  (everforest-faded_blue      "#419ba3" "#87afaf")
  (everforest-faded_purple    "#b475a1" "#d787af")
  (everforest-faded_aqua      "#5d9d80" "#87af87")
  (everforest-faded_orange    "#be6d6a" "#ff8700")

  (everforest-dark_red        "#544247" "#5f0000")
  (everforest-dark_blue       "#3b5360" "#000087")
  (everforest-dark_aqua       "#445349" "#005f5f")

  (everforest-delimiter-one   "#419ba3" "#008787")
  (everforest-delimiter-two   "#b475a1" "#d75f87")
  (everforest-delimiter-three "#83c092" "#87af87")
  (everforest-delimiter-four  "#be6d6a" "#d75f00")
  (everforest-white           "#FFFFFF" "#FFFFFF")
  (everforest-black           "#000000" "#000000")
  (everforest-sienna          "#c57fa4" "#d7875f")
  (everforest-lightblue4      "#62afb8" "#5fafaf")
  (everforest-burlywood4      "#a3ab9b" "#afaf87")
  (everforest-aquamarine4     "#7fbbb3" "#87af87")
  (everforest-turquoise4      "#5dc2d6" "#5fafaf")

  (everforest-ediff-current-diff-A        "#544247" "#4f2121")
  (everforest-ediff-current-diff-B        "#504f45" "#5f5f00")
  (everforest-ediff-current-diff-C        "#3b5360" "#4f214f")
  (everforest-ediff-current-diff-Ancestor "#445349" "#21214f")
  (everforest-ediff-fine-diff-A          "#503946" "#761919")
  (everforest-ediff-fine-diff-B           "#1c691c" "#1c691c")
  (everforest-ediff-fine-diff-C           "#761976" "#761976")
  (everforest-ediff-fine-diff-Ancestor    "#12129d" "#12129d")

  (everforest-bg everforest-dark0)
  (everforest-bg_inactive everforest-dark0_soft)
  )
 

 (custom-theme-set-variables 'everforest-dark-medium
                             `(ansi-color-names-vector
                               [,everforest-dark1
                                ,everforest-bright_red
                                ,everforest-bright_green
                                ,everforest-bright_yellow
                                ,everforest-bright_blue
                                ,everforest-bright_purple
                                ,everforest-bright_aqua
                                ,everforest-light1])
			     `(pdf-view-midnight-colors '(,everforest-light0 . ,everforest-bg))))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'everforest-dark-medium)

;; Local Variables:
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; everforest-dark-medium-theme.el ends here
