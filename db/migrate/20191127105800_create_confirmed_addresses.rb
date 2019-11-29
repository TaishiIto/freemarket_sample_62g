class CreateConfirmedAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :confirmed_addresses do |t|
      t.references :user, foreign_key: true
      t.integer :zip_code
      t.string :prefecture
      t.string :city
      t.string :house_number
      t.string :building_name
      t.timestamps
    end
  end 
end
