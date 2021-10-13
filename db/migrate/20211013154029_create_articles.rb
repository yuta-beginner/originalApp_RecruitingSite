class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :category
      t.string :article_industry
      t.integer :article_companyScale
      t.text :article_content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
