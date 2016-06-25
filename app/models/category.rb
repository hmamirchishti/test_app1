class Category < ActiveRecord::Base
  has_many :article_category
  has_many :articles, through: :article_category
validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 25}
end