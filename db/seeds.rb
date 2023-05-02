ApplicationRecord.transaction do 
  puts "Destroying tables..."
  # Unnecessary if using `rails db:seed:replant`
  User.destroy_all
  Question.destroy_all
  Answer.destroy_all
  Vote.destroy_all
  Tagging.destroy_all
  Tag.destroy_all

  puts "Resetting primary keys..."
  # For easy testing, so that after seeding, the first `User` has `id` of 1
  ApplicationRecord.connection.reset_pk_sequence!('users')
  ApplicationRecord.connection.reset_pk_sequence!('questions')
  ApplicationRecord.connection.reset_pk_sequence!('answers')
  ApplicationRecord.connection.reset_pk_sequence!('votes')
  ApplicationRecord.connection.reset_pk_sequence!('taggings')
  ApplicationRecord.connection.reset_pk_sequence!('tags')

  puts "Creating users..."
  

  User.create!(
      display_name: 'Abuya', 
      email: 'ombasabuya@gmail.com', 
      password: 'password'
  )

  User.create!(
  # Create one user with an auto-generated display name:
      display_name: 'Josphat',
      email: 'josphat@gmail.com', 
      password: 'pass1234'
  )

  User.create!(
    # Create one user with an auto-generated display name:
        display_name: 'Antony',
        email: 'osebe.anto@gmail.com', 
        password: 'pass1234'
    )

  #More users
  10.times do
    display_name = Faker::Games::SuperSmashBros.fighter
    User.create!({
      display_name: display_name,
      email: Faker::Internet.unique.email,
      password: 'pass1234'
    })
  end


  Question.create!(
      title: "RSPEC Command won't run?",
      body: 'I keep getting this error yet I have the script in package.json?!', 
      author_id: '1'
  )


  Tag.create!(
    name: 'JavaScript',
  )

  Tagging.create!(
    question_id: '1',
    tag_id: '1'
  )

  Question.create!(
      title: 'Ruby Configuration',
      body: 'How to configure ruby version 2.7.4 in my linux CLI ?.', 
      author_id: '3'
  )

  Question.create!(
      title: 'Moringa Software Engineering',
      body: 'How to complete Moringa Software Engineering course with ease? ', 
      author_id: '13'
  )

  100.times do
    Question.create!({
      title: Faker::Hacker.say_something_smart,
      body: Faker::Quotes::Shakespeare.hamlet_quote,
      author_id: Faker::Number.between(from: 1, to: 12)
    })
  end

  Question.create!(
    title: 'Ombasa is the best programmer in the entire cohort!',
    body: 'Consider offering him an opportunity',
    author_id: '4'
  )

  puts "Done!"
end