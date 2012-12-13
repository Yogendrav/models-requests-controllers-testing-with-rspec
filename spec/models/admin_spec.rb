require 'spec_helper'

describe Admin do
  before do
	 @admin = Admin.new(email: "superuser@superuser.com", hash: "iJXdppRiI52XsqJe", password: "736fc7f1f4f382e79f2278817d056a0ec14b9ff5", city_id: "", role_id: 4, request_hash: "", status: 1 ) 
  end
	
  subject { @admin }

  it { should respond_to :email }
  it { should respond_to :password }
  it { should respond_to :phone }
  
  it { should be_valid }

  describe "phone with valid format" do
  	before { @admin.phone = 1234567890 }
  	it { should be_valid } 
  end

  describe "email with valid format" do
  	it "should be valid" do
  		addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid_address|
        	@admin.email = valid_address
        	@admin.should be_valid
        end
    end
  end

  describe "email with invalid format" do
  	it "should be invalid" do
  		addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_address|
        	@admin.email = invalid_address
        	@admin.should_not be_valid
        end
    end
  end

  describe "when email is not present" do
  	before { @admin.email = "" }
  	it { should_not be_valid }
  end

  describe "when email is already taken" do
  	before do
  		admin_with_same_email = @admin.dup
  		admin_with_same_email.email = @admin.email.upcase
  		admin_with_same_email.save
  	end
  	it { should_not be_valid }
  end

  describe "email with mixed case" do
  	let (:mixed_case_email) { "usEr@ExamPle.Com" }
  	it " should be saved as all lower-case" do
  	  @admin.email = mixed_case_email
  	  @admin.save
  	  @admin.reload.email.should == mixed_case_email.downcase
  	end
  end

  describe "when password is not present" do
  	before { @admin.password = " " }
  	it { should_not be_valid }
  end

  describe "password is too short" do
  	before { @admin.password = "a" * 3 }
  	it { should be_valid }
  end

  describe "when role id is not present" do
  	before { @admin.role_id = "" }
  	it { should_not be_valid } 
  end

  describe "role with valid id" do
  	before { @admin.role_id = 3 }
  	it { should be_valid }
  end

end