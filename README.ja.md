# ChatGPT2Scratch

[English](README.md)

ChatGPT2Scratch は、Scratch ブロックから OpenAI の ChatGPT を利用したアプリケーションを開発できる Scratch の拡張機能です。

オリジナル
https://ichiroc.github.io/chatgpt2scratch/

## 使い方

1. ローカルPC上のLLMにアクセスすることで、APIキーを不要にしました。
2. 公開ページ準備中
3. 「拡張機能を選ぶ」画面を開き「ChatGPT2Scratch」を選びます
4. 最初に「API キーをセット」ブロックを実行して、 OpenAI のサイトから取得した API キーをセットします
5. 「〜〜の答え」のブロックを実行すると ChatGPT からの返答を取得することができます

## 開発者向け

自身のコンピュータでこの拡張を実行する方法を解説します。

1. scratch-gui のレポジトリをクローンします

```sh
git clone https://github.com/scratchfoundation/scratch-gui.git
cd scratch-gui
npm install
```

2. chatgpt2scratch のレポジトリ（このレポジトリ）をクローンします

ディレクトリは scratch-gui のまま以下を実行します。

```sh
git clone https://github.com/ichiroc/chatgpt2scratch.git
sh chatgpt2scratch/install.sh
```

3. `npm start` します

```sh
npm start
```

http://localhost:8601 を開けばアクセスできます

## ライセンス

ChatGPT2Scratch には AGPL 3.0 が適用されます。誰でも自由に利用、変更ができます。もし変更した場合はソースコードを共有する必要があります。

