class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :content
      t.string :texttype
      t.boolean :reported

      t.timestamps
    end
  end
end
