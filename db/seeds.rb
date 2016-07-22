# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [{:firstname => 'Aladdin', :lastname => "Prince of Thieves", :user_name => "Alibabwa", :address => "Taj Mahal", :phone => "NA", :created_time => "2016-07-22 10:17:51" },
  	    ]

users.each do |user|
  User.create!(user)
end
