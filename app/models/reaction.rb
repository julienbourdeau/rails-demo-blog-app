class Reaction < ApplicationRecord
  include AlgoliaSearch

  belongs_to :post

  validates :name, inclusion: {in: %w(up down star)}

  algoliasearch id: :algolia_id  do
    attributes :name, :post_id
    searchableAttributes ['name']
    attributesForFaceting ['name']
  end

  private

  def algolia_id
    "re_#{id}"
  end
end
