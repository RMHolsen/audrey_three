class AddHoursToSources < ActiveRecord::Migration[5.0]
  def change
    add_column :sources, :hours, :string
  end
end
