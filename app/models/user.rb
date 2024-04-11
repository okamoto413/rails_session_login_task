class User < ApplicationRecord
  #ユーザとタスクをアソシエーションし、タスク一覧画面には自分が作成したタスクのみを表示させる
  has_many :tasks, dependent: :destroy

#8.機能要件：名前が未入力の場合	名前を入力してください
  validates :name, presence: true

#8.機能要件：メールアドレスが未入力の場合	メールアドレスを入力してください
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true

  #8.機能要件：メールアドレスがすでに使用されていた場合	メールアドレスはすでに使用されています
  validates :email, presence: {message:"メールアドレスはすでに使用されています"}, uniqueness: true

  before_validation { email.downcase! }
  has_secure_password

#8.機能要件：パスワードが未入力の場合	パスワードを入力してください
  validates :password,presence: true
#8.機能要件：パスワードが6文字未満の場合	パスワードは6文字以上で入力してください
  validates :password, length: { minimum: 6}


#8.機能要件：パスワードとパスワード（確認）が一致しない場合	パスワード（確認）とパスワードの入力が一致しません
  #  validates :password_confirmation, uniqueness: true

end
