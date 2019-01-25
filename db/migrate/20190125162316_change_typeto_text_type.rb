class ChangeTypetoTextType < ActiveRecord::Migration[5.2]
  def change
  	rename_column :texts, :type, :texttype
  end
end
