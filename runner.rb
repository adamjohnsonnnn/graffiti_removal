require "soda"

client = SODA::Client.new({:domain => "data.cityofchicago.org", :app_token => "ZRasycWgICfntlKa08YKdK0I8"})

ward_api_results = client.get("7ia9-ayc2", :$limit => 1)

ward_query = ward_api_results[0]["ward"]

p "THIS IS THE WARD WE ARE LOOKING FOR: #{ward_query}"

graffiti_api_results = client.get("cdmx-wzbz", :$limit => 100)

graffiti_matches = graffiti_api_results.select { |removal_request| removal_request["ward"] == ward_query }

graffiti_matches.each do |graffiti_match|
	puts "#{graffiti_match['ward']}"
	puts "#{graffiti_match['status']}"
	puts "#{graffiti_match['street_address']}"
end



# puts "Got #{results.count} results. Dumping first results:"
# results.first.each do |k, v|
#   puts "#{k}: #{v}"
# end

# ward_results.first.each do |k,v| 
# 	puts "#{k}: #{v}"
# end
