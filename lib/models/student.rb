class Student < ActiveRecord::Base
has_many :yogas
has_many :teachers, through: :yogas

def self.tty_prompt
    TTY::Prompt.new
end

    def self.change_name_email
      system "clear"
         choice= self.tty_prompt.select("You may change your name and email from the options below.") do |menu|
              menu.choice "Change My Name"
              menu.choice "Change Email Address"
              menu.choice "Exit"
              binding.pry
          end
          update_info(choice)
        end

def self.update_info(choice)
system "clear"
  case choice
  when "Change My Name"
  self.update_name(self)
  # binding.pry
  when "Change Email Address"
    puts "TEST"
  # when "Delete Account"
  #      self.delete_id
  when "Exit"
    puts "TEST"
  end

end



def self.update_name
  system "clear"
  # tty_prompt.ask("What would you like to update your name to? Please write a new name:")
     new_name = tty_prompt.ask("What would you like to update your name to? Please write a new name:")
     self.update(name: new_name)
     puts "Your name has been updated to #{new_name}."

end


  # def self.delete_id
  #   confirm = TTY::Prompt.new.select("Are you sure you want to delete your account?", ["Yes", "No"])
  #       if confirm == "Yes"
  #           # self.destroy(Yoga.student_id)
  #           puts self.id
  #           # puts "\nSorry to see you go!\n"
  #      end
  #   end

# def self.helper_id
#   delete_id.select do |yogas|
#     yogas.id == self.id
#   end
#   # puts account
# end

end
