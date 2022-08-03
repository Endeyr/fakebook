# frozen_string_literal: true

# Create a main sample user.
User.create!(first_name: 'Example',
             last_name: 'User',
             email: 'example@railstutorial.org',
             password: 'foobar1234',
             password_confirmation: 'foobar1234')
# admin: true,
# activated: true,
# activated_at: Time.zone.now

# Generate a bunch of additional users.
99.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password1234'
  User.create!(first_name:,
               last_name:,
               email:,
               password:,
               password_confirmation: password)
  # activated: true,
  # activated_at: Time.zone.now
end

# Generate microposts for a subset of users.
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.posts.create!(content:) }
end

# Create following friendships, not finished
# users = User.all
# user  = users.first
# friendship = users[2..50]
# friendship.each { |friend| user.save(friend) }

puts 'Successfully seeded'
