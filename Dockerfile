# PHP 8.2 + Apache をベースに使用
FROM php:8.2-apache

# システムのパッケージリストを更新 & 必要なものをインストール
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    curl \
    vim \
    # Node.js (16系や18系など必要に応じて選択)
    # ここでは Node 18.x をインストールする例
    gnupg \
 && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
 && apt-get install -y nodejs

# PHP拡張機能（PDO, pdo_mysqlなど）を有効化
RUN docker-php-ext-install pdo_mysql

# Apacheのmod_rewriteを有効化 (Laravelでのルーティングなどに必要)
RUN a2enmod rewrite

# Composerをグローバルインストール
COPY --from=composer:2.5 /usr/bin/composer /usr/local/bin/composer

# Apache設定ファイルの上書き設定やDocumentRoot変更を行いたい場合はここで追加設定できます。
RUN sed -ri -e 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/000-default.conf

# コンテナ起動時に80番ポートを使用
EXPOSE 80

# 作業ディレクトリを /var/www/html に設定
WORKDIR /var/www/html
