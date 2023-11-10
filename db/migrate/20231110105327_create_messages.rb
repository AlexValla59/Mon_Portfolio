class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :nom
      t.string :email
      t.string :sujet
      t.text :message

      t.timestamps
    end
  end
end
