# ベースイメージとしてNode.jsを使用
FROM node:18

# 作業ディレクトリを設定
WORKDIR /app

# パッケージファイルをコピー
COPY ../../tokyu_branz_frontend/package.json ../../tokyu_branz_frontend/package-lock.json ./

# 依存関係をインストール（本番環境でも devDependencies を含める）
RUN npm install --include=dev

# Viteをグローバルインストール
RUN npm install -g vite

# ソースコードをコピー
COPY ../../tokyu_branz_frontend/ .

# 開発用サーバの起動
CMD ["npm", "run", "dev"]