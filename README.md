# 東急MyBranz 開発環境 構築手順

##### レポジトリをクローン
    git clone git@github.com:fujisawareon/tokyu_branz_setting.git
    git clone git@github.com:fujisawareon/tokyu_branz.git tokyu_branz_setting
    git clone git@github.com:fujisawareon/tokyu_branz_frontend.git tokyu_branz_setting

##### クローンした開発用ディレクトリに移動し、各コンテナを作成
    cd tokyu_branz_setting
    docker compose build

##### 
    cd tokyu_branz_frontend
    npm install
    cd ..
    docker compose up -d

##### 管理画面の初期設定
    docker exec -it tokyu_branz_app bash
    composer install
    cp .env.example .env
    php artisan key:generate
    chmod 777 -R storage/
    npm install
    npm run build

##### フロントの初期設定
    docker exec -it tokyu_branz_frontend bash


<br>

### 各URL
| システム名      | URL                                                                                                                               | 備考                                                             |
|------------|-----------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------|
| 管理画面       | <a href="http://localhost:8083/">http://localhost:8083/</a>                                                                       |                                                                |
| フロント画面     | 1. <a href="http://localhost:5173/">http://localhost:5173/</a><br/>2. <a href="http://localhost:5173/">http://localhost:3003/</a> | 1. コンテナに入らず npm run dev する場合<br/>2. コンテナ無いで npm run build する場合 |
| PhpMyAdmin | <a href="http://localhost:8003/">http://localhost:8003/</a>                                                                       |                                                                |



<br><br>

### 不具合時にイメージまで削除する場合
##### コンテナ停止して削除
    docker-compose down

##### イメージ削除
    docker rmi tokyu_branz_setting_frontend
    docker rmi tokyu_branz_setting_app


