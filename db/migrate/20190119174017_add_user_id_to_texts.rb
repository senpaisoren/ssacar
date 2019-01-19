class AddUserIdToTexts < ActiveRecord::Migration[5.2]
  def change
    add_column :texts, :user_id, :integer
    add_index :texts, :user_id
  end
end
