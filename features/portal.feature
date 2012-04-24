# language: ja
フィーチャ: サイトのトップページが期待通りに表示されていることを確認したい

  背景:
    前提 "トップ"ページを表示している

  シナリオ: トップページを表示する
    ならば  "Akiinyoブログ"と表示されていること

  シナリオ: 会員登録をする
    前提    "ブログを始める"リンクをクリックする
    ならば  "会員登録"と表示されていること

    かつ    "user[name]"に"akiinyo"と入力する
    かつ    "user[email]"に"akiinyo@example.com"と入力する
    かつ    "user[password]"に"password"と入力する
    かつ    "user[password_confirmation]"に"password"と入力する
    かつ    "登録する"ボタンをクリックする
    ならば  "akiinyo"と表示されていること
