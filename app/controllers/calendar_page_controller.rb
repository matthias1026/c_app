class CalendarPageController < ApplicationController
	def home
		if (params.has_key?(:month) && params.has_key?(:year))
			if (params[:month] == '13')
				@date = Date.new params[:year].to_i+1, params[:month].to_i-12
			elsif (params[:month] == '0')
				@date = Date.new params[:year].to_i-1, params[:month].to_i+12
			else
				@date = Date.new params[:year].to_i, params[:month].to_i
			end
		else
			@date = Date.today
		end

		@events = Event.where("event_date >= ? AND event_date <= ?", start_of_month, end_of_month)
	end

	def start_of_month
		@start_of_month = Date.new(@date.year, @date.month, 1)
	end

	def end_of_month
		@end_of_month = Date.new(@date.year, @date.month, Time.days_in_month(@date.month, @date.year))
	end
end