# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# 1000.times do
#   Sub.create!(title: Faker::Beer.name, description: Faker::Hipster.paragraph, moderator_id: 1)
#
# end

500.times do
  sub_ids = [2]

  Post.create!(title: Faker::ChuckNorris.fact, url: Faker::Internet.url, content: Faker::Hacker.say_something_smart, author_id: 2, sub_ids: sub_ids)
end
