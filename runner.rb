require "soda"
Hashie.logger = Logger.new(nil)

client = SODA::Client.new({:domain => "data.cityofchicago.org", :app_token => "ZRasycWgICfntlKa08YKdK0I8"})

# WARD API REQUEST WITH RESULT LIMITS ENABLED
# ward_api_results = client.get("7ia9-ayc2", :$limit => 1)

# RETURN ALL WARDS FROM CITY OF CHICAGO API
ward_api_results = client.get("7ia9-ayc2")

#INSTANTIATE EMPTY WARD STRING
ward_number = ""
ward_query = []

#FIND WARD NUMBER THAT MATCHES THE ALDERMAN'S LAST NAME INPUT INTO TERMINAL
ward_api_results.each do |ward|
	if ward["alderman"].split(' ')[-1].downcase == ARGV[0].to_s.downcase
		ward_number = ward["ward"]
		ward_query << ward
	end
end

# p "THIS IS THE WARD NUMBER WE ARE LOOKING FOR GRAFFITI REQUESTS: #{ward_number}"

# GRAFFITI REQUESTS API REQUEST WITH RESULT LIMITS ENABLED
# graffiti_api_results = client.get("cdmx-wzbz", :$limit => 100)

# RETURN ALL GRAFFITI REMOVAL REQUESTS FROM THE CITY OF CHICAGO
graffiti_api_results = client.get("cdmx-wzbz")

# MATCH ALL GRAFFITI REMOVAL REQUESTS TO THE WARD BEING SEARCHED
graffiti_matches = graffiti_api_results.select { |removal_request| removal_request["ward"] == ward_number }

# SET FINAL REMOVAL REQUESTS AS EMPTY ARRAY TO COLLECT VALIABLE RESULTS  
final_removal_requests = []

 # SET REMOVAL MONTH AND YEAR AS EMPTY STRING TO USE AS GLOBAL VARIABLE 
removal_month = ""
removal_year = ""

# FIND REMOVAL REQUESTS THAT MATCH MONTH AND YEAR INPUT BY USER INTO TERMINAL
graffiti_matches.each do |removal_request|
	removal_month = removal_request["creation_date"].split("-")[1]
	removal_year = removal_request["creation_date"].split("-")[0]
	if removal_month == ARGV[1] && removal_year == ARGV[2]
		final_removal_requests << removal_request
	end 
end

# p final_removal_requests[0]
# PRINT RESULTS
puts "Graffiti removal request details in Alderman #{ARGV[0]}'s ward during #{ARGV[1]}/#{ARGV[2]}:"
puts "Alderman: #{ward_query[0]['alderman']}"
puts "Ward Number: #{ward_number}"
puts "Month/Year: #{removal_month}/#{removal_year}"
puts "TOTAL GRAFFITI REMOVAL REQUESTS: #{final_removal_requests.count}"

