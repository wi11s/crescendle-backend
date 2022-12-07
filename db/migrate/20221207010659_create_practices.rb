class CreatePractices < ActiveRecord::Migration[7.0]
  def change
    create_table :practices do |t|
      t.string :name
      t.string :first
      t.string :second
      t.string :third
      t.string :first_note
      t.string :last_note

      t.timestamps
    end
  end
end
