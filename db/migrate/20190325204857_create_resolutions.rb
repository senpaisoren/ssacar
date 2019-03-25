class CreateResolutions < ActiveRecord::Migration[5.2]
  def change
    create_table :resolutions do |t|
      t.string :title
      t.text :content
      t.string :texttype
      t.boolean :reported
      t.boolean :solved

      t.timestamps
    end
  end
end
