class CreateCreations < ActiveRecord::Migration[7.0]
  def change
    create_table :creations do |t|
      t.string :nom
      t.text :description
      t.string :photos
      t.date :date
      t.string :logiciel
      t.string :poste_occupe
      t.string :entreprise

      t.timestamps
    end
  end
end
