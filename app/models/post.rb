class Post < ApplicationRecord
  has_many :post_authors
  has_many :authors, through: :post_authors
  has_many :reactions
end
