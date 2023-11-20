# db/seeds.rb

require 'faker'

# Constants for reaction types
REACTION_TYPES = ['thumbs_up', 'thumbs_down', 'heart', 'clap']

User.destroy_all
Post.destroy_all
Reaction.destroy_all

User.create!(
  username: 'admin',
  email: 'admin@learning-app-rails.com',
  password: 'password123',
  password_confirmation: 'password123',
)


# Create 10 users
1.times do
  user = User.new(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: 'password123', # Use a more secure password in a real application
    password_confirmation: 'password123' # Required if you have enabled confirmable module in Devise
    # Add other necessary user fields here
  )
  user.skip_confirmation! if user.respond_to?(:skip_confirmation!) # Skip confirmation if you have enabled confirmable module in Devise
  user.save!
end

# For each user, create 100 posts
User.all.each do |user|
  20.times do
    post = user.posts.create!(
      title: Faker::Lorem.sentence(word_count: 3),
      content: Faker::Lorem.paragraph(sentence_count: 5)
    )

    # For each post, create reactions from other users
    User.where.not(id: user.id).each do |other_user|
      reaction_type = REACTION_TYPES.sample
      post.reactions.create!(
        user: other_user,
        reaction_type: reaction_type
      )
    end
  end
end

puts "Database seeded successfully!"
