class AddContentToTexts < ActiveRecord::Migration[5.2]
  def change
    add_column :texts, :content, :text
  end
end
