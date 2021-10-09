class ChangeDatatypeCompanyScaleOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :companyScale, :integer, default: 3
  end
end
