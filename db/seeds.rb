require 'faker'

puts "destroy everything"
User.destroy_all
Profile.destroy_all

puts "creating 10 users"

user_array = []
skills_array = ["film making", "writing", "editing", "acting", "drawing", "animations", "marketing", "comedy", "clothing design", "digital design", "journalism"]
interests = []

10.times do
    user = User.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: "1234567"
      )
    user.save!
    user_array << user
end

puts "creating 10 profiles"

user_array.each do |user|
profile = Profile.create!(
  user_id: user.id,
  skills: skills_array.sample(3),
  bio: Faker::Lorem.sentence(word_count: 20)
  )
end


