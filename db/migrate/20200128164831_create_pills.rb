class CreatePills < ActiveRecord::Migration[6.0]
  def change
    create_table :pills do |t|
    
      t.string :name
      t.string :purpose
      t.string :description
      t.string :dose
      t.string :pregnancy
      t.string :warnings
      t.string :stop_use
      t.string :brand
      t.string :route
      t.string :package_label
      t.timestamps
    end
  end
end
