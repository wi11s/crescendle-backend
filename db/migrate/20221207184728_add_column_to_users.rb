class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :interval_high_score, :integer
  end
end
