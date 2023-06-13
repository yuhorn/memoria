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
[![Image from Gyazo](https://i.gyazo.com/dd491fd2a24860435957739babdf49fb.gif)](https://gyazo.com/dd491fd2a24860435957739babdf49fb) 
[![Image from Gyazo](https://i.gyazo.com/7b5dc2757aa346b7e4f26ecf5b1150b7.gif)](https://gyazo.com/7b5dc2757aa346b7e4f26ecf5b1150b7) 
[![Image from Gyazo](https://i.gyazo.com/52cb8542a989984e612aa1df20554428.gif)](https://gyazo.com/52cb8542a989984e612aa1df20554428) 
[![Image from Gyazo](https://i.gyazo.com/8311bd9c3484ed9e6e6cbadea0670cdb.gif)](https://gyazo.com/8311bd9c3484ed9e6e6cbadea0670cdb) 
[![Image from Gyazo](https://i.gyazo.com/dbd01ef4783f960058ddbe5d1cda23ed.gif)](https://gyazo.com/dbd01ef4783f960058ddbe5d1cda23ed)

# 実装予定の機能
・アプリ概要説明ページ  
・ユーザー詳細、編集機能  
・検索機能  
・フォロー認証機能（鍵付きアカウント設定）  
・プライバシー設定（写真毎に公開・非公開設定）  
・動画投稿機能  
・複数同時投稿機能  
・投稿写真加工、編集機能  
・他SNSアカウントと紐付け

# データベース設計
![er](https://github.com/yuhorn/memoria/assets/119820982/9d571549-135c-409f-aad3-d20727368b19)

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
![sennizu](https://github.com/yuhorn/memoria/assets/119820982/92dadcfd-5016-4db5-aa4e-265ae5a1da94)

# 開発環境
・フロントエンド  
・バックエンド  
・テスト  
・テキストエディタ  

# ローカルでの動作方法
% git clone https://github.com/yuhorn/memoria.git  
% cd memoria  
% bundle install  
% yarn install

# 工夫したポイント
アルバムのように、日々の写真を記録したり、投稿を後から見返すことに特化するよう設計しました。SNSが普及したことで他のユーザーからの反響ありきで投稿することが多いですが、自分や家族が見返すために写真投稿を残すことを最優先に考え、敢えてコメント機能はなくして他のユーザーの反応を気にせず投稿できるようにしました。未実装ですが追加機能として、フォロー認証機能やプライバシー設定を実装して許可したユーザーのみにアルバムを共有したり、検索機能を実装して公開されたアルバムをカテゴリー別に表示、閲覧したりできるようにしたいと思っています。