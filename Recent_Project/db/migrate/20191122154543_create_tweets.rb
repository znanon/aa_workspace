class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.integer :tweeter_id
      t.integer :reply_id
      t.text :body

      t.timestamps
    end
    add_index :tweets, :tweeter_id
    add_index :tweets, :reply_id 
  end
end
