# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

@now = Time.now.freeze

def create(model_const, count, &block)
  x = Array.new(count).map do |n|
    attr = block.call n
    attr[:updated_at] = @now
    attr[:created_at] = @now
    attr
  end
  model_const.insert_all x

  model_const.last(count).pluck(:id)
end

def create_posts(count)
  create(Post, count) do
    {
      title: Faker::Book.title,
      content: Faker::Markdown.sandwich,
      published_at: rand(1..1000).days.ago + rand(-240..600).minutes,
    }
  end
end

def create_authors(count)
  create(Author, count) do |n|
    {
      full_name: Faker::Name.name,
      distinguished: Faker::Boolean.boolean(true_ratio: 0.2),
    }
  end
end

def seed(author_count, post_count, post_batch_size = 10)
  puts Rainbow("Inserting #{author_count} Authors...").blue
  author_ids = create_authors(2000)

  per_loop = post_count / post_batch_size
  post_batch_size.times do
    puts Rainbow("Inserting #{per_loop} Posts...").green
    post_ids = create_posts(per_loop)

    authors_attr = []
    reactions_attr = []
    post_ids.each do |post_id|
      authors_attr << author_ids.sample(rand(1..12)).map do |a_id|
        {post_id: post_id, author_id: a_id}
      end
      reactions_attr << Array.new(rand(0..1000)).map { {name: %w(up down star).sample, post_id: post_id} }
    end
    authors_attr.flatten!
    reactions_attr.flatten!

    puts Rainbow("Inserting #{authors_attr.count} PostAuthors").blue
    PostAuthor.insert_all authors_attr
    puts Rainbow("Inserting #{reactions_attr.count} Reactions").blue
    Reaction.insert_all reactions_attr
  end
end

seed(2000, 5000)
