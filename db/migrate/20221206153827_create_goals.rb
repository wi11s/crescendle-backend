class CreateGoals < ActiveRecord::Migration[7.0]
  def change
    create_table :goals do |t|
      t.string :content
      t.integer :complete
      t.string :complete_by
      t.integer :user_id

      t.timestamps
    end
  end
end
