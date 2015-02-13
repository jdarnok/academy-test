user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
City.create(name: "Kraków")
City.create(name: "Warszawa")
City.create(name: "Łódź")
City.create(name: "Katowice")
City.create(name: "Białystok")
