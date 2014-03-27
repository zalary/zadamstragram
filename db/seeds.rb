# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

zal =  User.new({:name => "Zalary", :email => "zalary@gmail.com", :password => "123456zal", :password_confirmation => "123456zal"})

zal.skip_confirmation!
zal.save!

adam =  User.new({:name => "Adam", :email => "adamshukur@gmail.com", :password => "123456adam", :password_confirmation => "123456adam"})

adam.skip_confirmation!
adam.save!

todd =  User.new({:name => "Todd", :email => "todd@themakersquare.com", :password => "whydicutmyhair?!", :password_confirmation => "whydicutmyhair?!"})
todd.skip_confirmation!
todd.save!

Post.create(pic_url: "http://i.imgur.com/nRqnkp5.jpg", user_id: 2)
Post.create(pic_url: "http://i.imgur.com/RepqfUE.jpg", user_id: 3)


Post.create(pic_url: "http://i.imgur.com/xmzFf4Z.jpg", user_id: 3)
Post.create(pic_url: "http://i.imgur.com/HlC79vG.jpg", user_id: 2)

Post.create(pic_url: "http://i.imgur.com/ExktfIb.jpg", user_id: 1)
Post.create(pic_url: "http://i.imgur.com/WLJZMbj.jpg", user_id: 1)

zal.follow!(adam)
zal.follow!(todd)
