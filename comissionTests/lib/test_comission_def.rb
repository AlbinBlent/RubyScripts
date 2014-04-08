#!/usr/bin/env ruby

require 'watir'

module TestSalesReport

	def set_login_details(user, password)
		@user = user
		@password = password
	end

	def enter_login_details(user, password)
		#@user = user
		#@password = password
		$browser.text_field(:name => "username").set "#{user}"
		$browser.text_field(:name => "password").set "#{password}"
	end

	def check_who_is_logged_in()
		puts @user
		$browser.text.include? "You are logged in as " + @user
	end

	def check_error_message()
		$browser.text.include? "Error"
	end

	def press_login_button
		$browser.button(:name => 'login').click
	end

	def enter_date_locks_stocks_barrels(date, locks, stocks, barrels)
		@date = date
		@locks = locks
		@stocks = stocks
		@barrels = barrels

		$browser.text_field(:name => "inDate").set "#{date}"
		$browser.text_field(:name => "locksSold").set "#{locks}"
		$browser.text_field(:name => "stocksSold").set "#{stocks}"
		$browser.text_field(:name => "barrelsSold").set "#{barrels}"
	end
end