require 'spec_helper'

describe SalesEnquiry do
	before do
		@sales_enquiry = SalesEnquiry.new(name: "GFDDFG", your_name: "DFSDFG", owner_name: "Restaurant Owner", email: "FDGDF", address1: "FDGDF", address2: "DFGDF", zip_code: 0, phone: "FDGDF", website: "FDGDF", order_day: "DFG", combo_meals: 0, home_delivery: "yes", status: 0 )
	end

	subject { @sales_enquiry }

	it { should respond_to :name }
	it { should respond_to :your_name }
	it { should respond_to :owner_name }
	it { should respond_to :email }
	it { should respond_to :address1 }
	it { should respond_to :address2 }
	it { should respond_to :zip_code }
	it { should respond_to :phone }
	it { should respond_to :website }
	it { should respond_to :order_day }
	it { should respond_to :combo_meals }
	it { should respond_to :home_delivery }
	it { should respond_to :status }

	#it { should be_valid }

	describe "when name is nil" do
		before { @sales_enquiry.name = "" }
		it { should_not be_valid }
	end

	describe "your_name is not present" do
		before { @sales_enquiry.your_name = "" }
		it { should_not be_valid }
	end

	describe "owner_name is not present" do
		before { @sales_enquiry.owner_name = "" }
		it { should_not be_valid }
	end

	describe "email is not present" do
		before { @sales_enquiry.email = "" }
		it { should_not be_valid }
	end

	describe "address1 is not present" do
		before { @sales_enquiry.address1 = ""}
		it { should_not be_valid }
	end

	describe "address2 is not present" do
		before { @sales_enquiry.address2 = "" }
		it { should_not be_valid }
	end

	describe "zip_code should not be blank" do
		before { @sales_enquiry.zip_code = ""}
		it { should_not be_valid }
	end

	describe "phone should not be blank" do
		before { @sales_enquiry.phone = "" }
		it { should_not be_valid }
	end

	describe "when website is not present" do
		before { @sales_enquiry.website = "" }
		it { should_not be_valid }
	end

	describe "when order_day is not present" do
		before { @sales_enquiry.order_day = "" }
		it { should_not be_valid }
	end

	describe "combo_meals should not be blank" do
	    before { @sales_enquiry.combo_meals = "" }
	    it { should_not be_valid }
	end 

	describe "home_delivery should not be blank" do
		before { @sales_enquiry.home_delivery = "" }
		it { should_not be_valid }
	end

	describe "when status is not present" do
		before { @sales_enquiry.status = "" }
		it { should_not be_valid }
	end
end