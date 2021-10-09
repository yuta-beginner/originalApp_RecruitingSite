class ChangeDatatypeCompanyScale < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :companyScale, :integer, using: "companyScale::integer"
  end
end
