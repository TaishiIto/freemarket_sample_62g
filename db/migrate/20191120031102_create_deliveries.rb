class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.references :item, foreign_key: true
      t.integer    :delivery_cost, nul: false
      t.integer    :delivery_days, null: false
      t.integer    :delivery_ways, null: false
      t.timestamps
    end
  end
end
