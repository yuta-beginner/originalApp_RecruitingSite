class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :category, null: false, default: 0
      t.string :article_industry, null: false
      t.integer :article_companyScale, null: false, default: 3
      t.text :article_content, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
