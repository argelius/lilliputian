require 'io/console'

namespace :users do
    desc "Create new user."
    task :add => :environment do
        print "email: "
        email = STDIN.gets.strip
        
        print "name: "
        name = STDIN.gets.strip

        print "password: "
        password = STDIN.noecho(&:gets).strip
        puts ""

        print "confirm password: "
        confirm = STDIN.noecho(&:gets).strip
        puts ""

        user = User.new(:email => email, :name => name, :password => password, :password_confirmation => confirm)

        if user.save
            puts "User successfully created."
        else
            puts user.errors.inspect
            puts "Failed creating user."
        end
    end

    desc "Delete user."
    task :delete => :environment do
        print "email: "
        email = STDIN.gets.strip

        user = User.where("LOWER(email) = LOWER(?)", email).first

        if user.nil?
            puts "No such user."
        elsif user.delete
            puts "User removed."
        else
            puts "Unable to remove user."
        end
    end
end
