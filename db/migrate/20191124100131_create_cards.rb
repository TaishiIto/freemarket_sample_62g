class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :customer_id
      t.string :card_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
