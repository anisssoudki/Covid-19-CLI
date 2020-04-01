class Country 
	attr_accessor :country, :city, :province, :lastUpdate, :confirmed, :deaths, :recovered, :keyID
	@@all = []
	def initialize(hash)
	  hash.each do |k, v|
	  self.send("#{k}=", v) if self.respond_to?("#{k}=")
	  end
	  save
	end
	def save
	  @@all << self
	end
	def self.all 
	  @@all
	end
	def self.find_by_country(name)
	  self.all.select do |country|  
	  country.country.capitalize == name
	  end
	end
	def self.find_by_city(name)
	  self.all.select do |country|
	  country.city.capitalize == name
	  end
	end
	def self.find_by_state(name)
	  self.all.select do |country|
	  country.province.capitalize == name
	  end
	end
end
