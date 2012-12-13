require 'spec_helper'

describe DMeal do
	before do
		@d_meal = DMeal.new(name: "Yogesh", cuisine_id: 6)
	end

	subject { @d_meal }

	it { should respond_to :name }
	it { should respond_to :cuisine_id }

	it { should be_valid }

	describe "when name is not present" do
		before { @d_meal.name = "" }
		it { should_not be_valid }
	end

	describe "when cuisine_id is not present" do
		before { @d_meal.cuisine_id = "" }
		it { should_not be_valid }
	end
end