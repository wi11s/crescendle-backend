class CreateGuesses < ActiveRecord::Migration[7.0]
  def change
    create_table :guesses do |t|
      t.string :abc
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
