require 'spec_helper'

describe RestaurantSch do
	before do
		@restaurant_sch = RestaurantSch.new(date: 2012-06-22, status: 0, quantity: 30, dish_id: 144)
	end

	subject { @restaurant_sch }

	it { should respond_to :date }
	it { should respond_to :status }
	it { should respond_to :quantity }
	it { should respond_to :dish_id }

	it { should be_valid }

	describe "when date is not present" do
		before { @restaurant_sch.date = "" }
		it { should_not be_valid }
	end

	describe "when status is not present" do
		before { @restaurant_sch.status = "" }
		it { should_not be_valid }
	end

	describe "when quantity is not present" do
		before { @restaurant_sch.quantity = "" }
		it { should_not be_valid }
	end

	describe "when dish_id is not present" do
		before { @restaurant_sch.dish_id = "" }
		it { should_not be_valid }
	end

end