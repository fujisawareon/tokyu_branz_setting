# 東急のMyBranzブランズの開発環境構築手順

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

docker exec -it tokyu_branz_frontend bash
```
# 各URL
・管理画面<br>
　<a href="http://localhost:8083/">http://localhost:8083/</a><br>
・フロント<br>
　・コンテナ無いで npm run build する場合<br>
　　npm run dev を実行して表示されるリンク　例）<a href="http://localhost:5173/">http://localhost:5173/</a><br>
　・コンテナに入らず npm run dev する場合<br>
　　<a href="http://localhost:5173/">http://localhost:3003/</a><br>
・PhpMyAdmin<br>
　<a href="http://localhost:8003/">http://localhost:8003/</a>


# 不具合時にイメージまで削除する時の手順
```
# コンテナ停止して削除
 docker-compose down

 # イメージ削除
 docker rmi tokyu_branz_setting-frontend
```



