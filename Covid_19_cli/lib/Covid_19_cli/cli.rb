
class Covid19Cli::CLI
	attr_accessor :user
	
	def user_name
	  puts "Please enter your name"
	  print"> "
	  @user = gets.chomp.strip.upcase
	end
	
	def slow_motion(string)
	  string.each_char {|c| print c ; sleep 0.02 }
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
	     elsif input == "exit"
		goodbye(@user)
		exit
	     else
		 invalid_entry
	   end
   	 end
	
    def country_list
    		Country.all.each_with_index do |country, index|
    		  puts "#{index + 1}. country: #{country.country} province: #{country.province} city: #{country.city}"
    		end
    	  user_pick 
    end
	
    	def user_pick
    	  loop do 
    	    puts " "
    	    puts "Which country, state or city would you like details about: "
    	    input = gets.chomp.strip.capitalize
    		if input == "Exit"
    		  break
    		elsif input == "List"
    		  country_list
    		else	
    		  country_selection(input) && city_selection(input) && state_selection(input)
    		end
          end
	  goodbye(@user)
	end
	
 	def country_selection(name)
	  countries = Country.find_by_country(name)
	    countries.each do |country| 
	      puts  "Name of country:                    #{c.country}"
	      puts  "province or state:                  #{c.province}"
	      puts  "city:                               #{c.city}"
	      puts  "lastUpdated:                        #{c.lastUpdate}"
	      puts  "Number of confirmed cases:          #{c.confirmed}"
	      puts  "Number of dead people by covid 19:  #{c.deaths}"
	      puts  "Number of recovered people:         #{c.recovered}"
	      puts  " "
	    end
	end
	
	def city_selection(name)
	   countries = Country.find_by_city(name)
	    countries.each do |country|
	      puts  "Name of country:                    #{c.country}"
	      puts  "province or state:                  #{c.province}"
	      puts  "city:                               #{c.city}"
	      puts  "lastUpdated:	                    #{c.lastUpdate}"
	      puts  "Number of confirmed cases:          #{c.confirmed}"
	      puts  "Number of dead people by covid 19:  #{c.deaths}"
	      puts  "Number of recovered people: 	       #{c.recovered}"
	      puts  " "
	    end
	end	
	
	def state_selection(name)
	  countries = Country.find_by_state(name)
	    countries.each do |country|
	      puts  "Name of country:                    #{c.country}"
	      puts  "province or state:                  #{c.province}"
	      puts  "city:                               #{c.city}"
	      puts  "lastUpdated:	                    #{c.lastUpdate}"
	      puts  "Number of confirmed cases:          #{c.confirmed}"
	      puts  "Number of dead people by covid 19:  #{c.deaths}"
	      puts  "Number of recovered people: 	       #{c.recovered}"
	      puts  " "
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
