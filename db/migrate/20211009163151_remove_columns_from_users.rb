class RemoveColumnsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :name
    remove_column :users, :type 
    remove_column :users, :graduateYear
    remove_column :users, :university
    remove_column :users, :industry
    remove_column :users, :companyScale
    remove_column :users, :selfPR
  end
end
