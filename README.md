## foldersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |

### Association
- has_many :files

## filesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| folder           | references | foreign_key: true              |
| title            | string     | null: false                    |
| caption          | text       | null: false                    |

### Association
- belongs_to: folder
