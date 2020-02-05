class CreatePillListJoins < ActiveRecord::Migration[6.0]
  def change
    create_table :pill_list_joins do |t|

      t.integer :pill_list_id
      t.integer :pill_id
      t.timestamps
    end
  end
end
