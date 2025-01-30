# ベースイメージとしてNode.jsを使用
FROM node:18

# 作業ディレクトリを設定
WORKDIR /app

# パッケージファイルをコピー
COPY ../../frontend/package.json ../../frontend/package-lock.json ./

# 依存関係をインストール（本番環境でも devDependencies を含める）
RUN npm install --include=dev

# Viteをグローバルインストール
RUN npm install -g vite

# ソースコードをコピー
COPY ../../frontend/ .

# 開発用サーバの起動
CMD ["npm", "run", "dev"]