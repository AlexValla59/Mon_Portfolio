class AddFormatAndImagePathsToCreations < ActiveRecord::Migration[7.0]
  def change
    add_column :creations, :format, :string
    add_column :creations, :image_paths, :string
  end
end

