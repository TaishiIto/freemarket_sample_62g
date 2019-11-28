class RemoveColumnItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :images, :text
  end
end
