 user = User.new
 user.email = "admin2@gem.com"
 user.password = "Haramuss21"
 user.save
 user.add_role "admin"