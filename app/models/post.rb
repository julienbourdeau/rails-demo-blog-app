class Post < ApplicationRecord
  has_many :post_authors
  has_many :authors, through: :post_authors
  has_many :reactions

  def content_html
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(content)
  end
end
