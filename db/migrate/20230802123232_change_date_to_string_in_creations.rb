class ChangeDateToStringInCreations < ActiveRecord::Migration[7.0]
  def change
    change_column :creations, :date, :string
  end
end
