class FixSolvedName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :texts, :solved, :resolved
  end
end
