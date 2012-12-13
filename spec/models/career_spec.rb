require 'spec_helper'

describe Career do
	before do
	  @career = Career.new(name: "Yogesh", email: "yogeshwaghmare@gamil.com", file: "R3iA_Sample-CH3.pdf")
	end

	subject { @career }

	it { should respond_to :name }
	it { should respond_to :email }
	it { should respond_to :file }

	it { should be_valid }

	describe "when name is not present" do
		before { @career.name = " " }
		it { should_not be_valid }
	end

	describe "email with valid format" do
		it "should be valid" do
			addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
			  addresses.each do |valid_address|
				@career.email = valid_address
				@career.should be_valid
			  end
		end
	end

	describe "email with invalid format" do
		it "should be invalid" do
			addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
                addresses.each do |invalid_address|
                  @career.email = invalid_address
                  @career.should_not be_valid
                end
        end
    end

    describe "when email is not present" do
    	before { @career.email = "" }
    	it { should_not be_valid }
    end

    describe "when email is already taken" do
    	before do
    	  career_with_same_email = @career.dup
  		  career_with_same_email.email = @career.email.upcase
  		  career_with_same_email.save
    	end
    	it { should_not be_valid }
    end

    describe "email with mixed case" do
    	let(:mixed_case_email) { "User@GmAil.com" }
    	it "should be saved as all lower case" do
    		@career.email = mixed_case_email
    		@career.save
    		@career.reload.email.should == mixed_case_email.downcase
    	end
    end

    describe "when file is not present" do
    	before { @career.file = "" }
    	it { should_not be_valid }
    end

    describe "file with valid format" do
    	it "should be valid" do
    		attachments = %w[%r{\.(pdf)$}i]
    		attachments.each do |valid_attachment|
    			@career.file = valid_attachment
    		    @career.should_not be_valid
    		end
    		
    	end
    end

    describe " file with invalid format" do
    	it "should be invalid" do
    		attachments = %w[%R{\.(pdf)$}i/k]
    		attachments.each do |invalid_attachment|
    			@career.file = invalid_attachment
    			@career.should_not be_valid
    		end
    	end
    end
end