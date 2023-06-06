# アプリケーション名
memoria

# アプリケーション概要
ペットの写真をアルバムとして管理し、ユーザー同士でシェアできる。

# URL
https://memoria-beur.onrender.com

# テスト用アカウント
・Basic認証ID：admin  
・Basic認証パスワード：2222  
・メールアドレス：test@gmail.com  
・パスワード：test01

# 利用方法
## アルバム新規作成、写真投稿
1. トップページ（アルバム一覧）か写真一覧ページのヘッダーからユーザー登録を行う  
2. アルバム新規作成ボタンから、アルバムの内容（アルバムの名前、カテゴリー、表紙用画像）を入力し作成する  
3. 写真投稿ボタンから、投稿内容（画像、写真の名前、撮影日）を入力し投稿する
## 他のユーザーとシェア
1. アルバム一覧からカテゴリーごとに検索して見たいアルバムを探せる  
2. 気に入ったアルバムをお気に入り登録できる


# アプリケーションを作成した背景
「ペットの写真を投稿、検索するためによくSNSを使うが、気疲れしてしまう」という自分の課題を分析した結果、「求めていなくても攻撃的なコメントが目に入ってしまう」ということが真因であると仮説を立てた。真因を解決するために、コメント機能をなくして、写真管理、閲覧に特化したアプリケーションを開発することにした。

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1Rn-wsXG9RAg9qc5za1HGb_ddaZGurIh74zXct1C4tjE/edit?usp=sharing)

# 実装した機能についての画像やGIFおよびその説明
実装完了後、追記予定

# 実装予定の機能
検索機能、フォロー認証機能（鍵付きアカウント設定）

# データベース設計
## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### association
- has_many :albums
- has_many :photos

## albums テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| category_id | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### association
- belongs_to :user
- has_many :photos

## photos テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| memo   | string     | null: false                    |
| date   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
| album  | references | null: false, foreign_key: true |

### association
- belongs_to :user
- belongs_to :album
#
# 画面遷移図
実装完了後、追記予定

# 開発環境
・フロントエンド  
・バックエンド  
・テスト  
・テキストエディタ  

# ローカルでの動作方法
実装完了後、追記予定

# 工夫したポイント
実装完了後、追記予定