class CreateTelephones < ActiveRecord::Migration
  def change
    create_table :telephones do |t|
      t.string :name
      t.text :Address
      t.integer :phoneno
      t.string :city

      t.timestamps
    end
  end
end
