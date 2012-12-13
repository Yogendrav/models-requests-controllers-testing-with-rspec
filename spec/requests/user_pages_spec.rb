require 'spec_helper'

describe "UserPages" do

	subject { page }

	describe "profile page" do
		#let(:user) { FactoryGirl.create(:user) }
		before { visit user_pages_path(user_pages) }
	end

		  
    describe "sign up page" do
      before { visit user_pages_signup_path }
     # it { should have_selector('p', text: 'New user?') }
	end

end
