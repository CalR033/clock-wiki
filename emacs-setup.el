;;; emacs-setup.el --- ox-hugo configuration for 時計の事典 (clock-wiki)
;;
;; このファイルを Emacs の init.el (または ~/.emacs.d/init.el) に
;; (load "C:/Users/nszwt/clock-wiki/emacs-setup.el") で読み込んでください。
;;
;; 必要パッケージ: ox-hugo (MELPA 経由)
;;   M-x package-install RET ox-hugo RET

;;; ============================================================
;; 1. パッケージシステムの設定 (すでに設定済みならスキップ)
;;; ============================================================

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;; ============================================================
;; 2. leaf による ox-hugo のロード
;;; ============================================================

(leaf ox-hugo
  :ensure t          ; MELPA から自動インストール
  :after ox)         ; ox (Org Export) のロード後に有効化

;;; ============================================================
;; 3. ox-hugo の基本設定
;;; ============================================================

;; Hugo プロジェクトのルートディレクトリ (Windows 絶対パス)
;; ※ バックスラッシュではなくスラッシュを使うこと
(setq org-hugo-base-dir "C:/Users/nszwt/clock-wiki")

;; Org ファイルの保存と同時に Hugo 用 Markdown を自動エクスポート
;; (必要に応じてコメントアウトを外してください)
;; (add-hook 'after-save-hook
;;           (lambda ()
;;             (when (and (eq major-mode 'org-mode)
;;                        (org-hugo--get-front-matter))
;;               (org-hugo-export-wim-to-md))))

;; デフォルトのエクスポート先セクション
(setq org-hugo-default-section-directory "posts")

;; 日付フォーマット (Hugo の frontmatter 用)
(setq org-hugo-date-format "%Y-%m-%dT%T+09:00")

;;; ============================================================
;; 4. 記事テンプレート (org-capture との連携例)
;;; ============================================================

;; Org ファイルの置き場:
;;   C:/Users/nszwt/Documents/org-mode/04_projects/clock/clock-wiki.org
;;
;; org-capture テンプレートに時計の事典用エントリを追加
;; M-x org-capture → 'W' で起動 ('w' は他に使っている場合は変更してください)

(with-eval-after-load 'org-capture
  (add-to-list 'org-capture-templates
               '("W" "時計の事典 記事 (clock-wiki)" entry
                 (file "C:/Users/nszwt/Documents/org-mode/04_projects/clock/clock-wiki.org")
                 "* TODO %?\n:PROPERTIES:\n:EXPORT_FILE_NAME: %(read-string \"スラッグ(英数字): \")\n:EXPORT_DATE: %<%Y-%m-%dT%T+09:00>\n:EXPORT_TAGS[]: \n:EXPORT_CATEGORIES[]: \n:END:\n\n%i\n"
                 :prepend t)))

;;; ============================================================
;; 5. 便利なキーバインド
;;; ============================================================

;; Org バッファ内で C-c C-e H H → カレントサブツリーをエクスポート
;; Org バッファ内で C-c C-e H A → 全サブツリーをエクスポート
;; これらは ox-hugo がロードされると自動的に利用可能になります。

;;; emacs-setup.el ends here
