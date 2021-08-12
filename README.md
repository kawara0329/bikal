# README
## :bike:*アプリ名：bikal (バイカル)*
<img src = "https://birdstory.net/bswp/wp-content/uploads/2020/08/200819illust.png" width = "30%">

### bike（バイク） x rental（レンタル） = **bikal**
## :earth_americas:*概要（できること）*
<img src = "https://young-machine.com/wp-content/uploads/2018/05/001-16.jpg" width = "30%">  

個人対個人で**バイクの貸し借りが気軽にできるアプリ**です。  
このアプリを使えば１日単位で借りたい日、貸したい日にバイクのレンタルを行う事が出来ます。

## :seedling:*制作背景（意図）*
<img src = "https://img.kb-cdn.com/imgviewer/NVpIM2ptOHhYRzVmUk5rM1NrNlFxYVV6enV4aGk2UFRJMmxPckdDUUVNWjFmMTVtMUNDdkdZcm9saS9IQ0xJV0YrYXgrQzFQdDJBT0drUXViTlAwQ1JNOVlXU21hK1FHQ1hSeXljWDVobm1tU0xTYStzeVBIeGxERXlpTVdvR2hNbU9IQ1NuSlhEVUloaEk1NFEzTEJKVGZWTExoeXRuT282RnRTcFVsNUZkYkxKZW5ZRjdPRUg2RnhtdVRwUjZMOStOTks0aDByblZzSVBWVG83ZzNNRlgrdnlINDY0Z2psbWc5NUFhay9uVVFhdzdmZCtSSlR3S0kyWHZWWC9DVQ==" width = "30%">  

このアプリを思い付いた**きっかけ**としては、私が以前にバイクの購入を検討した際に買ってもバイクを置くスペースが無いという事から始まりました。  
**所有は出来ないけどバイクには乗りたい！という人**は私の他にも一定数存在すると考えた時に浮かんだ手段が**レンタル**でした。  
レンタルであれば空いた時間に乗る事が出来て、終わったら返却すればいい。しかも、その都度好きな車種に乗ることが出来るというメリットがあります。  
しかし、借りられる店舗が近くにない。借りに行くのに電車で行くのは面倒。そもそもレンタル店舗が少ない。  
など同時にデメリットも浮かびました。  
そこで、**貸主が店舗では無く個人**であれば、且つ住所での検索や乗りたい車種の絞り込みが出来れば、このような課題をクリアできるのではないかと考えました。実際にバイクを売らずに所有している人にヒアリングを行ったところ、売るまででは無いがたまにしか乗らなかったり休みの日しか乗らないという人がほとんどでした。  
なぜなら、バイクの免許を取る動機や所有する目的の大多数がツーリングでの気分転換や趣味趣向であることからです。  
そして、その使わない期間に有効活用が出来たら借主貸主の需要と供給が結ばれる。このようなターゲット（ペルソナ）を繋ぐツールがあればという考えから当アプリの作成に踏み切りました。

## :books:*実装予定の内容*
<img src = "https://t.pimg.jp/024/026/651/1/24026651.jpg" width = "30%">  

- 会員登録（借主、貸主）
- レンタルバイク登録、１日レンタル金額設定（貸主）
- １日レンタル手続き（貸出フォームから借主貸主でメッセージのやりとり）
- 住所からレンタルバイク検索
- 車種からレンタルバイク検索
- レンタルバイクをトップページにて一覧を見れる機能
- メッセージ受信時にメールで知らせてくれる機能
## *DB設計*

## users テーブル

|Column            |Type       |Options      |
| email            |string     | null: false |
| password         |string     | null: false |
| nickname         |string     | null: false |
| postal_code      |string    | null: false |
| prefectures_id   |integer   | null: false |
| municipality     |string    | null: false |
| address          |string    | null: false |

### Association
has_many :bikes
has_many :messages
has_many :rooms, through: :room_users
has_many :room_users

## bikes テーブル

|Column         |Type        |Options                        |
| name          | string     | null: false                   |
| size          | integer    | null: false                   |
| category_id   | integer    | null: false                   |
| user          | references | null: false, foreign_key: true|

### Association
belongs_to :user
has_many :rooms

## messages テーブル

|Column        |Type        |Options                         |
| room_id      | references | null: false, foreign_key: true |
| message      | text       | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association
belongs_to :users
belongs_to :rooms

## rooms テーブル

|Column       |Type        |Options                         |
| user_id     | references | null: false, foreign_key: true |
| bike_id     | references | null: false, foreign_key: true |

### Association
has_many :messages
has_many :users, through: :room_users
has_many :room_users
belongs_to :bikes

## room_users テーブル

|Column      |Type        |Options                         |
| user_id    | references | null: false, foreign_key: true |
| room_id    | references | null: false, foreign_key: true |

### Association
belongs_to :users
belongs_to :rooms