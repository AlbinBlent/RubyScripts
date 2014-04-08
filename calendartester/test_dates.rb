require 'watir'
require "test/unit"

require_relative 'lib\test_dates_def' 

class TC_TestDates < Test::Unit::TestCase

	include TestDates

	def setup
		$browser = Watir::Browser.new :firefox
		#$browser = Watir::IE.new
		#$browser = Watir::Browser.new :chrome

		$browser.goto "http://localhost/Calendar/index.html"
	end
	 
	def teardown
		#$browser.close
	end

	def test_01_test_dates
		enter_year_month_day(2000, 2, 2)
		submit_button
		assert( compare_page_output_to(2000, 2, 3) )

	end
end