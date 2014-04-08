#!/usr/bin/env ruby

require 'watir'

module TestDates

	def enter_year_month_day(year, month, day)
		#@year = year
		#@month = month
		#@day = day

		$browser.text_field(:name => "year").set "#{year}"
		$browser.text_field(:name => "month").set "#{month}"
		$browser.text_field(:name => "day").set "#{day}"
	end

	def submit_button
		if $browser.button(:name, "submitbtn").exists?
			
		end
		$browser.button(:name, "submitbtn").present?
		

		$browser.button(:name, "submitbtn").value
		
		#$browser.button(:class => 'btn btn-primary').click
		#$browser.button(:xpath, '//INPUT[@TYPE="BUTTON"]').when_present.click
		$browser.button(:name => 'submitbtn').fire_event("onclick")
		#$browser.element(:css => 'input[type=submit][name=submitbtn]').click
		
	end

	def compare_page_output_to(year,month,day)


		puts "Today: #{day}/#{month}/#{year}"
		puts $browser.text.include? "Today: #{day}/#{month}/#{year}"
		$browser.text.include? "Today: #{day}/#{month}/#{year}"
		# FRÅGA LAOSHI HUR MAN FÅR MED TEXT I ASSERTIONS
	end
	
end