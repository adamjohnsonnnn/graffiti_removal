module ApplicationHelper

	def return_ward(alderman_last_name)
		client = SODA::Client.new({:domain => "data.cityofchicago.org", :app_token => "ZRasycWgICfntlKa08YKdK0I8"})
		ward_api_results = client.get("7ia9-ayc2")
		ward_api_results.each do |ward_result|
			if ward_result["alderman"].split(' ')[-1].downcase == alderman_last_name.downcase
				return ward_result
			end
		end	
	end

	def return_removal_requests(ward_number)
		client = SODA::Client.new({:domain => "data.cityofchicago.org", :app_token => "ZRasycWgICfntlKa08YKdK0I8"})		
		graffiti_api_results = client.get("cdmx-wzbz")
		graffiti_matches = graffiti_api_results.select { |removal_request| removal_request["ward"] == ward_number }
		return graffiti_matches
	end

	def sort_by_month_year(graffiti_removal_requests, queried_month, quried_year)
		final_removal_requests = []	
		graffiti_removal_requests.each do |removal_request|
			removal_month = removal_request["creation_date"].split("-")[1]
			removal_year = removal_request["creation_date"].split("-")[0]
			if removal_month == queried_month && removal_year == quried_year
				final_removal_requests << removal_request
			end 
		end
		return final_removal_requests
	end

end
