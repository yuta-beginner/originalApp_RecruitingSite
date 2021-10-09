class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string # userにカラム追加
    add_column :users, :humanType, :integer, null: false, default: 0 # userにカラム追加
    add_column :users, :graduateYear, :integer # userにカラム追加
    add_column :users, :university, :string # userにカラム追加
    add_column :users, :industry, :string # userにカラム追加
    add_column :users, :companyScale, :integer, default: 3 # userにカラム追加
    add_column :users, :selfPR, :text # userにカラム追加
  end
end
