class CreateIndividualStats < ActiveRecord::Migration[7.0]
  def change
    create_table :individual_stats do |t|
      t.integer :user_id
      t.integer :song_id
      t.integer :number_of_plays
      t.integer :number_of_guesses
      t.integer :completed

      t.timestamps
    end
  end
end
