class ChangeTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :type, :integer, null: false, default: 0
  end
end
