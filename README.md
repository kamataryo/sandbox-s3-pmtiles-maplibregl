# sandbox-s3-pmtiles-maplibregl

kamataryo/sandbox-s3-pmtiles-maplibregl は、pmtiles 配信基盤の terraform テンプレートと、pmtiles を読み込んで表示する maplibre-gl ベースの地図のフロントエンドを提供するデモンストレーションのリポジトリです。

## 概要

このプロジェクトは、pmtiles データを AWS S3 上にホストし、それを利用して地図を表示する maplibre-gl.js ベースのフロントエンドを提供します。このリポジトリには、以下の機能が含まれています。

- pmtiles 配信基盤の terraform テンプレート (`./terraform`)
- pmtiles を読み込んで表示する maplibre-gl ベースの地図のフロントエンド (`./client`)

## 始め方

### 前提条件

- AWS アカウント
- Terraform がインストールされていること
- Node.js がインストールされていること

### インストール/セットアップ

```bash
$ git clone https://github.com/kamataryo/sandbox-s3-pmtiles-maplibregl.git
# インフラ構築
$ pushd terraform
$ terraform init
$ terraform apply
$ popd
# フロントエンドの表示
$ pushd client
$ yarn
$ yarn build
$ npx http-server -o -c-1 ./dist
```
