class CreatePillLists < ActiveRecord::Migration[6.0]
  def change
    create_table :pill_lists do |t|

      t.string :name
      t.string :desc
      t.integer :user_id
      t.timestamps
    end
  end
end
