class AddColumnToDescription < ActiveRecord::Migration
  def change
    add_column :article, :created_at, :datetime
    add_column :article, :updated_at, :datetime
  end
end
