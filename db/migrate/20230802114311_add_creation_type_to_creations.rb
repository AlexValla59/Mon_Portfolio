class AddCreationTypeToCreations < ActiveRecord::Migration[7.0]
  def change
    add_column :creations, :creation_type, :string
  end
end
