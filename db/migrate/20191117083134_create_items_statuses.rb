class CreateItemsStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :items_statuses do |t|
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
      t.integer    :buyer_id
      t.integer    :item_status, default: 1
      t.integer    :rate, null: false, default: 0
      t.text       :review
      t.timestamps
    end
  end
end
