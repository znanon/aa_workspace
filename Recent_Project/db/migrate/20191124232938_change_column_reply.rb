class ChangeColumnReply < ActiveRecord::Migration[5.2]
  def change
    change_column :tweets, :reply_id, :integer
  end
end
