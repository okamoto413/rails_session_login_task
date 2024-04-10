class UserIdToTasks < ActiveRecord::Migration[6.1]
  def change
    # add_column :tasks, :user_id, :integer
    add_reference :tasks, :user, null: false, foreign_key: true
  end
end
