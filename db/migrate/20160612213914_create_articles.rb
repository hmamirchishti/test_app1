class CreateArticles < ActiveRecord::Migration

  def change
    create_table :article do |t|
      t.string :title
      t.text :description
    end
  end

end
