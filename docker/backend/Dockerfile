# PHP 8.2 + Apache をベースに使用
FROM php:8.2-apache

# システムのパッケージリストを更新 & 必要なものをインストール
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    curl \
    vim \
    gnupg \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    libmagickwand-dev \
    libmagickcore-dev \
    imagemagick \
    pkg-config \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# GD拡張を JPEG/Freetype 対応で構成・インストール
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo_mysql

# imagick 拡張（Intervention Image v3 対応）をインストール
RUN pecl install imagick \
    && docker-php-ext-enable imagick

# Apache の mod_rewrite を有効化（Laravel ルーティング対応）
RUN a2enmod rewrite

# Composer インストール
COPY --from=composer:2.5 /usr/bin/composer /usr/local/bin/composer

# DocumentRoot の変更（Laravel publicディレクトリをルートに）
RUN sed -ri -e 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/000-default.conf

# ポートを公開
EXPOSE 80

# 作業ディレクトリ
WORKDIR /var/www/html