require 'watir'
require "test/unit"
require "selenium-webdriver"

require_relative 'lib\test_dates_def' 

class TC_TestDates < Test::Unit::TestCase

	include TestDates

	def setup
		profile = Selenium::WebDriver::Firefox::Profile.new
		profile["network.proxy.type"] = 0
		$browser = Watir::Browser.new :firefox, :profile => profile

		#$browser = Watir::Browser.new :firefox
		#$browser = Watir::IE.new
		#$browser = Watir::Browser.new :chrome

		$browser.goto "http://localhost/Calendar/index.html"
	end
	 
	def teardown
		$browser.close
	end

	def test_01_test_correct_dates
		enter_year_month_day(2000, 2, 2)
		submit_button
		assert( compare_page_output_to(2000, 2, 2), 
			message = "Output dosent match input")
	end
	def test_02_test_wrong_dates
		enter_year_month_day(2000, 2, 2)
		submit_button
		assert( compare_page_output_to(2000, 2, 3), 
			message = "Output dosent match input")
	end
	def test_03_test_dates
		enter_year_month_day(2000, 13, 2)
		submit_button
		assert( ($browser.text.include? "Invalid month! Needs to be between 1 and 12."), 
			message = "Error messages dont work")
	end
end