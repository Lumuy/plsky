# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.delete_all
for i in 1..6
   Post.create id: i, title: 'This is a bad sotry', content: 'When I decided to rebuild my static blog website in Rails, I had trouble deciding how to build dynamic show pages for each blog post'
end

Comment.delete_all
for i in 1..6
  Comment.create id: i, body: 'this is a comment #{i}', post_id: i
end
