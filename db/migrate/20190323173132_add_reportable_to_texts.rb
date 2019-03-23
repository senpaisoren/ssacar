class AddReportableToTexts < ActiveRecord::Migration[5.2]
  def change
    add_column :texts, :reported, :boolean
  end
end
