# tokyu_branz_setting




```
# 本レポジトリをクローン
git clone git@github.com:fujisawareon/tokyu_branz_setting.git

# クローンしたディレクトリに移動
cd tokyu_branz_setting

# アプリケーションのソースをクローン
git clone git@github.com:fujisawareon/tokyu_branz.git

# コンテナを作成
docker compose build
docker compose up -d

# アプリの初期設定
docker exec -it tokyu_branz_app bash
composer install
cp .env.example .env
php artisan key:generate
chmod 777 -R storage/
npm install
npm run build
```
