class CreateSources < ActiveRecord::Migration[5.0]
  def change
    create_table :sources do |t|
      t.string :name 
      t.string :location
      t.string :contact
      t.boolean :fee, default: true 
    end
  end
end
