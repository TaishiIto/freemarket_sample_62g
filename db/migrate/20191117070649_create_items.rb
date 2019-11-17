class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name , null: false, index: true
      t.text :description, null: false
      t.integer :price, null:false
      t.integer :condition, null: false
      t.string :brand, default: ""
      t.integer :size_id
      t.integer :category_id
      t.timestamps
    end
  end
end
