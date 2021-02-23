class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name 
      t.string :material
      t.string :creator
      t.integer :publication_date
      t.belongs_to :list 
    end
  end
end
