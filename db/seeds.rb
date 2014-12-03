# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


amz = Services::AmazonSimpleSearch.new
items = amz.query("9780321200686")
book = Book.from_amz_item(items.first)
book.save

body = {:title => "Sleepy Hollow", :isbn => "1234567890", author: "Chris Johnson"}.to_json
5.times do
  CommandSource.create(user_id: 123, body: body, class_type: "Books::CreateBookCommand")
end
