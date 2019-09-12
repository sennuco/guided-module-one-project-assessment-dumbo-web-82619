class User < ActiveRecord::Base
    has_many :yogas
    has_many :teachers, through: :yogas

    def self.tty_prompt
        TTY::Prompt.new
    end

    def self.handle_new_member

        name = self.tty_prompt.ask('What is your name?', required: true)
        email_address = self.tty_prompt.ask('Please enter in a valid email address.', required: true) do |q|
          q.validate(/\A\w+@\w+\.\w+\Z/)
          q.messages[:valid?] = 'Invalid email address.'
        end
        password = self.tty_prompt.mask("Please enter a new password.", required: true)
        Student.create(name: name , email_address: email_address , password: password)
        sleep 1.2
        # binding.pry
    end

    def self.handle_returning_member
        email_address = self.tty_prompt.ask("Welcome back! What is your email address?")
        password = self.tty_prompt.mask("Please enter your password.")
        Student.find_by(email_address: email_address , password: password)

    end




    end
