class AddCurrentDeckToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :current_deck, :integer, default: 0, null: false
  end
end
