class CreateGuesses < ActiveRecord::Migration[7.0]
  def change
    create_table :guesses do |t|
      t.string :abc
      t.float :accuracy
      t.references :user, null: false, foreign_key: true
      t.integer :song_id

      t.timestamps
    end
  end
end
