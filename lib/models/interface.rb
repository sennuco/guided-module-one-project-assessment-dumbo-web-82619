class Interface
  attr_reader :prompt
  attr_accessor :user


  def initialize()
    @prompt = TTY::Prompt.new
  end

  def welcome
    system 'clear'
    art= puts <<-'EOF'
    wWWWw               wWWWw
    vVVVv (___) wWWWw         (___)  vVVVv
    (___)  ~Y~  (___)  vVVVv   ~Y~   (___)
    ~Y~   \|    ~Y~   (___)    |/     ~Y~
    \|   \ |/   \| /  \~Y~/   \|     \ |/
    \\|// \\|// \\|/// \\|//  \\|//  \\\|///
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    EOF
    art

    puts " "
    puts "                   ॐ Welcome To Om Yoga! ॐ               "
    puts "                      Healing Begins Now              "
    puts "                              🙏         "
    puts "                          "
    choice = self.prompt.select("🌱 Are you a new member or returning member?") do |menu|
      menu.choice "New Member"
      menu.choice "Returning Member"
    end
    case choice
    when "New Member"
      User.handle_new_member
    when "Returning Member"
      User.handle_returning_member
    end


  end

  def main_menu
    system "clear"
    choice = self.prompt.select("Welcome Back! Please select an option from the menu.") do |menu|
      menu.choice "View Available Yoga Classes"
      menu.choice "Modify Class Schedule"
      menu.choice "Exit"
    end
    second_menu(choice)
  end

  # => SECOND MENU
  def second_menu(choice)
    system "clear"

    case choice
    when "View Available Yoga Classes"
      Yoga.handle_view_class(self.user)
    when "Modify Class Schedule"
      choice= self.prompt.select("Please choose an option below.") do |menu|
        menu.choice "Change Classes"
        menu.choice "View Classes"
        menu.choice "Drop Class"
      end
    when "Exit"
       puts "exit"
      end
      third_menu(choice)
    end
  end


  def third_menu(choice)

    case choice
    when "View Classes"
      self.user.yogas.map do |yogas|
        puts  "Class Date: #{yogas.time}  Class Name: #{yogas.specialty} Teacher: #{yogas.teacher_id}"
      end
    when "Change Classes"
      puts "it works?"
    when "Drop Class"
      account = self.user.yogas.map do |yogas|
        yogas.destroy.id
        puts "has been deleted"
      end
      # binding.pry
    when "Exit"
      puts "exit"
    end

  end
