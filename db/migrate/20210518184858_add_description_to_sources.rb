class AddDescriptionToSources < ActiveRecord::Migration[5.0]
  def change
    add_column :sources, :description, :text
  end
end
