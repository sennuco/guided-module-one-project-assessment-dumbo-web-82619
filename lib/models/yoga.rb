class Yoga < ActiveRecord::Base
belongs_to :teachers
belongs_to :students

def self.tty_prompt
    TTY::Prompt.new
end

def self.handle_view_class(student_instance)
  system "clear"
  choice = self.tty_prompt.select("Please select an available Yoga class from the menu! 🙏") do |menu|
      menu.choice "Vinyasa Yoga"
      puts " "
      menu.choice "Ashtanga Yoga"
      puts " "
      menu.choice "Power Yoga"
      puts " "
      menu.choice "Yin Yoga"
      puts " "
      menu.choice "Exit"
    end
second_view_class(choice, student_instance)
end

def self.second_view_class(choice,student_instance)

   case choice
  when "Vinyasa Yoga"
     timeslots = ["[Monday]2:00p.m.-3:00p.m.", "[Tuesday]4:30p.m.-5:30p.m.", "[Wednesday]11:30a.m.-12:30p.m.", "[Friday]1:20p.m.-2:20p.m."]
       choice  = self.tty_prompt.select("Please select and avail time.",timeslots)
        if choice
          # binding.pry
          Yoga.create(time: choice , specialty:"Vinyasa Yoga" , student_id: student_instance.id , teacher_id:Teacher.second.id)

        end 
  when "Ashtanga Yoga"

  when "Power Yoga"

  when "Yin Yoga"

  when "Exit"

    puts "exit"
  end

end

def main_menu_end
    welcome_menu
end


def self.handle_view_poses
puts "pose connection works"
end







end
