class RequestsController < ApplicationController

	def create
		ward = return_ward(params[:alderman_last_name])
		if ward 
			@ward_number = ward["ward"]
			@alderman_full_name = ward["alderman"]
			graffiti_removal_requests = return_removal_requests(@ward_number)
			@removal_month = params[:month]
			@removal_year = params[:year]
			final_removal_requests = sort_by_month_year(graffiti_removal_requests, @removal_month, @removal_year)
			@total_request_count = final_removal_requests.count
			if @total_request_count > 0
				render 'show', layout: false, locals: {alderman: @alderman_full_name, ward_number: @ward_number, removal_month: @removal_month, removal_year: @removal_year, total_request_count: @total_request_count} 
			else	
				@errors = ["Your search did not yield any results. Try again."]
				render 'new', layout: false
			end
		else
			@errors = ["Your search did not yield any results. Try again."]
			render 'new', layout: false
		end			

	end

end