class AddTypeToTexts < ActiveRecord::Migration[5.2]
  def change
    add_column :texts, :type, :string
  end
end
