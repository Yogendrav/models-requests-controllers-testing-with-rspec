require 'spec_helper'

describe "Admin Login page" do

	subject { page }

	describe "admin login page" do
		before { visit admin_login_path }
		it { should have_selector('p', text: 'Admin Login') }

		describe "with valid information" do
			#let(:admin) { FactoryGirl.create(:admin) }
			before do
				fill_in "email", with: "superuser@superuser.com"
				fill_in "password", with: "superuser"
				click_button "login"
			end
			#it { should have_link('logout', href: 'logout_path') }
		end
	end

end