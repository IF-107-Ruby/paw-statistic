require 'factory_bot_rails'

User.create!(
  first_name: 'Jon',
  last_name: 'White',
  email: 'jonwhite@domain.com',
  password: 'jon123',
  password_confirmation: 'jon123'
)
