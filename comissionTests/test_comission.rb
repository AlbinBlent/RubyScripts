require 'watir'
require "test/unit"
require "selenium-webdriver"

require_relative 'lib\test_comission_def' 

class TC_TestDates < Test::Unit::TestCase

	include TestSalesReport

	def setup
		profile = Selenium::WebDriver::Firefox::Profile.new
		profile["network.proxy.type"] = 0
		$browser = Watir::Browser.new :firefox, :profile => profile
	end
	 
	def teardown
		$browser.close
	end

	#def test_01_test_login_error
	#	assert(enter_login_details("Albin", "wrongpass"), 
	#		message = "Could not set login details")
	#	assert(press_login_button, 
	#		message = "could not click login button")
	#	assert(check_error_message(), 
	#	message = "Could not read error message")
	#end

	def test_02_test_login
		set_login_details("Albin", "Albin")
		assert(enter_login_details("Albin", "Albin"), 
			message = "Could not set login details")
		assert(press_login_button, 
			message = "could not click login button")
		assert(check_who_is_logged_in(), 
			message = "Logged in user does not match login details")
	end
end