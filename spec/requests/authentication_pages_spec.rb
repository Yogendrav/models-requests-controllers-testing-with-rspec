require 'spec_helper'

describe "AuthenticationPages" do
  
  subject { page }

	describe "home page" do
		before { visit user_page_home_path }
		it { should have_selector('title', text: 'iWannaEat.com - Home') }
		#it { should have_selector('h1', text: 'root_url') }

	end

	describe "login banner" do
		before { visit user_page_home_path  }
		it { should have_selector('p', text: 'Daily!') }
		it { should have_selector('span', text: 'Delivering Meal choices,') }

		describe "member login group" do
			before { visit user_page_home_path }
			it { should have_selector('p', text: 'Members Login') }

			describe "with valid information" do
				before { visit users_login_path}
				let(:user) { FactoryGirl.create(:user) }
				before do
					fill_in "email", with: "niharika.mehta@gmail.com"
					fill_in "password", with: 123
					click_button "login" 
				end
				it { should have_selector('div.clear', text: 'hey') }
				 
			end

		end
	end

	# describe "forgot password" do
	#   let(:user) { FactoryGirl.create(:user) }
	#   before { visit users_forgot_password_path }
	#   before do
	# 	fill_in "email", with: "niharika.mehta@gmail.com"
	# 	click_button "Submit"
	#   end
	#   it { should have_selector('label', text: 'Email') }
	# end
end
