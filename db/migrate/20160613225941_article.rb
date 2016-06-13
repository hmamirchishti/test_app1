class Article < ActiveRecord::Migration
  def change
    create_table "articles", force: :cascade do |t|
      t.string   "title"
      t.text     "description"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
