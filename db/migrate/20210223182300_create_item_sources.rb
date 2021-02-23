class CreateItemSources < ActiveRecord::Migration[5.0]
  def change
    create_table :item_sources do |t|
      t.belongs_to :source 
      t.belongs_to :item 
    end
  end
end
