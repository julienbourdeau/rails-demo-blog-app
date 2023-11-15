class Reaction < ApplicationRecord
  belongs_to :post

  validates :name, inclusion: {in: %w(up down star)}
end
