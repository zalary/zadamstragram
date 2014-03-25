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