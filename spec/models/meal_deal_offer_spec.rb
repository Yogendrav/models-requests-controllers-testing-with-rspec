require 'spec_helper'

describe MealDealOffer do
   before do
   	  @meal_deal_offer = MealDealOffer.new( target: 67 )
   end

   subject { @meal_deal_offer }

   it { should respond_to :target }

   it { should be_valid }
end