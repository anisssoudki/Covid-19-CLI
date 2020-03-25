
require "unirest"
response = Unirest.get "https://covid-19-coronavirus-statistics.p.rapidapi.com/v1/stats",
  headers:{
    "X-RapidAPI-Host" => "covid-19-coronavirus-statistics.p.rapidapi.com",
    "X-RapidAPI-Key" => "8d9120e1afmshb6b445981516549p1492cfjsn061d2541e6fb"
  }
x = response.body
print x
x.shift
x.shift
x.shift
response =  x.sort
response[0].slice!(0)
my_hash =  response[0][0]
my_hash.shift
new_hash = my_hash.collect do |value| value end  
new_hash[0].slice!(0)
data = new_hash[0][0]

puts "  "
puts "  "
puts "  "
 print data