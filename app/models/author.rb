class Author < ApplicationRecord
  has_many :post_authors
  has_many :posts, through: :post_authors
end
