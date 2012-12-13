require 'spec_helper'

describe "User pages" do
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

			describe "with invalid information" do
				before { click_button "Login" }
			end
		end
	end


	
end
