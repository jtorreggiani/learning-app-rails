# frozen_string_literal: true

# db/seeds.rb

require 'faker'

# Constants for reaction types
REACTION_TYPES = %w[thumbs_up thumbs_down heart clap].freeze

User.destroy_all
Post.destroy_all
Reaction.destroy_all

User.create!(
  username: 'admin',
  email: 'admin@learning-app-rails.com',
  password: 'password123',
  password_confirmation: 'password123'
)

# Create 10 users
100.times do
  user = User.new(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: 'password123', # Use a more secure password in a real application
    password_confirmation: 'password123' # Required if you have enabled confirmable module in Devise
  )
  puts "Created user: #{user.username} - #{user.email}"
  # Skip confirmation if you have enabled confirmable module in Devise
  user.skip_confirmation! if user.respond_to?(:skip_confirmation!)
  user.save!

  post = user.posts.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    content: Faker::Lorem.paragraph(sentence_count: 5)
  )
  puts "Created post: #{post.title} - #{post.content}"
  post.reactions.create!(
    user: User.all.sample,
    reaction_type: 'thumbs_up',
  )
end

puts 'Database seeded successfully!'
