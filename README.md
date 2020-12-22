## アプリ名
Your records

## foldersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |

### Association
- has_many :records

## recordsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| folder           | references | foreign_key: true              |
| title            | string     |                                |
| caption          | text       |                                |

### Association
- belongs_to: folder
