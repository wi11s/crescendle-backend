class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.string :key_signature
      t.string :time_signature
      t.string :abc_notation
      t.string :info
      t.integer :user_id
      t.integer :date

      t.timestamps
    end
  end
end
