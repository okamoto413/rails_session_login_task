class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    #5.開発要件(名前、メールアドレス、パスワード　userテーブル作成)
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest, null: false

      t.timestamps
       t.index :email, unique: true
    end
  end
end
