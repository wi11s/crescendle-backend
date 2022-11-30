class CreatePlays < ActiveRecord::Migration[7.0]
  def change
    create_table :plays do |t|
      t.integer :user_id
      t.integer :song_id
      t.integer :number_of_plays

      t.timestamps
    end
  end
end
