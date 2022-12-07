class CreatePractices < ActiveRecord::Migration[7.0]
  def change
    create_table :practices do |t|
      t.string :name
      t.string :first
      t.string :second
      t.string :third

      t.timestamps
    end
  end
end
