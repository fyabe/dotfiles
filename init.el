
;; package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;; バックアップファイルを作らない
(setq backup-inhibited t)

;;タブ幅を 4 に設定
(setq-default tab-width 4)

;; メニューバーを非表示にする
(menu-bar-mode 0)

; 日付、時刻の表示
(require 'time)
(setq display-time-24hr-format t)
(setq display-time-string-forms
      '( year  "/" month "/" day "(" dayname ") " 24-hours ":" minutes))
(display-time-mode t)

;; 対応するかっこを強調表示する
(show-paren-mode t)

;; C-h to backspace
(define-key global-map "\C-h" 'delete-backward-char)

;; migemo
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-user-dictionary nil)
(setq migemo-coding-system 'utf-8)
(setq migemo-regex-dictionary nil)
(load-library "migemo")
(migemo-init)

;;; helm
;;; init.elの最後に定義すること
(require 'helm-config)
;; (require 'helm-migemo)
