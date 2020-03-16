
class Covid19Cli::CLI
	attr_accessor :user
	def user_name
		puts "Please enter your name"
		print"> "
		@user = gets.chomp.strip.upcase
	end
		def slow_motion(string)
			string.each_char {|c| print c ; sleep 0.12 }
		end
	def call
		user_name
	 	slow_motion("Welcome ")
	  	slow_motion(@user)
	  	puts " "
	  	slow_motion"Enter =>'list' to see country list"
	  	puts " "
	  	slow_motion"To exit the application, enter =>'exit'.".upcase
	  	puts " "
	  	Api.get_data
	  	menu
	end
	def menu
		print "> "
		input = gets.strip.downcase
		if input == "list"
			country_list 
			menu
	    elsif input == "exit"
			goodbye(@user)
	  	else
		 	invalid_entry
	    end
    end
    def country_list
    	Country.all.each_with_index do |country, index|
    		#calls out a list of all countries and provinces with their
    		puts "#{index + 1}. #{country.country} province of #{country.province}"
    	end
    	puts " "
    	puts "Which country would you like details about: "
    	input = gets.chomp.strip.capitalize
    	country_selection(input)
    end

 	def country_selection(name)
		#go over array and find the country selected
		c = Country.find_by_country(name)
		c.each do |c| 
	puts  "country:		#{c.country}"
	puts  "province:	#{c.province}"
	puts  "lastUpdated:	#{c.lastUpdated}"
	puts  "confirmed:  	#{c.confirmed}"
	puts  "death: 		#{c.death}"
	puts  "recovered: 	#{c.recovered}"
	
		end
	end

    def invalid_entry
  		puts "Invalid entry, try again"
		menu
    end
    def goodbye(user)
    	slow_motion"Goodbye #{@user} Dont forget to wash your hands, and sanatize!"
    	
    end
end