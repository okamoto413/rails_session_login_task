class Task < ApplicationRecord
  #ユーザとタスクをアソシエーションし、タスク一覧画面には自分が作成したタスクのみを表示させる
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  end
