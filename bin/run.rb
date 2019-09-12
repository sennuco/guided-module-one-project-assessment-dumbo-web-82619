require_relative '../config/environment'

puts "hello world"


cli = Interface.new
user_object = cli.welcome

while user_object == nil
  user_object = cli.welcome
end

cli.user = user_object

# puts "Welcome back #{user_object.name} !"

cli.main_menu


# binding.pry
# 0
