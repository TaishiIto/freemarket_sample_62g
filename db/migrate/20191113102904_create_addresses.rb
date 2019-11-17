class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :zip_code, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building_name
      t.integer :user_id
      t.integer :prefecture_id

      t.timestamps
    end
  end
end
