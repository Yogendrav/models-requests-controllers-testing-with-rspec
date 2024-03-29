require 'spec_helper'

describe User do
	before do

	  @user = User.new(name: "", email: "yogendra@gmail.com",
	  	               password: "e4b26720a01125cf84e331d6667dc8f9a61658d6", hash: "ojhZaz3NqL7aihan", 
                       cluster_id: 1, points: "",  
                       phone: 123456789, po: 12345, address: "ab road", street: "indore", zipcode: 123456 )
	end
	
	subject { @user }

	it { should respond_to (:name) }
	it { should respond_to (:email) }
    it { should respond_to (:password_digest)}
	it { should respond_to (:password) }
	it { should respond_to (:password_confirmation) }
    it { should respond_to (:authenticate) }


	it { should be_valid }

	describe " when email is not present " do
		before { @user.email = " " }
		it { should_not be_valid }
	end

	describe "when email format is invalid" do
      it "should be invalid" do
        addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_address|
          @user.email = invalid_address
          @user.should_not be_valid
        end      
      end
    end

	describe "when email format is valid" do
      it "should be valid" do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid_address|
          @user.email = valid_address
          @user.should be_valid
        end      
      end
    end

    describe "when email address  is already taken" do
    	before do
    		user_with_same_email = @user.dup
    		user_with_same_email.email = @user.email.upcase
    		user_with_same_email.save
    	end

    	it { should_not be_valid }
    end

    describe "when password is not present" do
    	before { @user.password = @user.password_confirmation = " " }
    	it { should_not be_valid }
    end

    describe "when password is too short" do
    	before { @user.password = @user.password_confirmation = "a" * 3 }
    	it { should be_valid }
    end

    describe "when password does not match confirmation" do
    	before { @user.password_confirmation = "mismatch" }
    	it { should_not be_valid }
    end

    describe "when password confirmation is nil" do
    	before{ @user.password_confirmation = nil }
    	it { should be_valid }
    end

    describe "email address with mixed case" do
        let (:mixed_case_email) { "uSer@exAMplE.com" }

        it " should be saved as all lower-case" do
            @user.email = mixed_case_email
            @user.save
            @user.reload.email.should == mixed_case_email.downcase
        end
    end

    describe "po with numerical value" do
        before { @user.po = 12345 }
        it { should be_valid }
    end

    describe "when po is not present" do
        before { @user.po = " "}
        it { should_not be_valid }
    end

    describe "when po format is not valid" do
        before { @user.po = "12asd22" }
        it { should_not be_valid }
    end

    describe "phone with valid format" do
        before { @user.phone = "123456789" }
        it { should be_valid }
    end

    describe "when phone format is not valid" do
        before { @user.phone = "asdfghkjl12234" }
        it { should_not be_valid }
    end

    describe "when phone is not present" do
        before { @user.phone = " " }
        it { should_not be_valid }
    end

    describe "zipcode with valid format" do
        before { @user.zipcode = 123456 }
        it { should be_valid }
    end

    describe "when zipcode is not present" do
        before { @user.zipcode = " " }
        it { should_not be_valid }
    end

    describe "when zipcode format is not valid" do
        before { @user.zipcode = "vhf123455" }
        it { should_not be_valid }
    end

    describe "when street is present" do
        before { @user.street = "abc, 123 indore" }
        it { should be_valid }
    end

    describe "when street is too long" do
        before { @user.street = "a" * 150 }
        it { should be_valid }
    end

    describe "when street is not present" do
        before { @user.street = " " }
        it { should be_valid }
    end

    describe "return value of authenticate method" do
      before { @user.save }
      let(:found_user) { User.find_by_email(@user.email) }

      describe "with valid password" do
        it { should == found_user.authenticate(@user.password) }
      end

      describe "with invalid password" do
        let(:user_for_invalid_password) { found_user.authenticate("invalid") }

        it { should_not == user_for_invalid_password }
        specify { user_for_invalid_password.should be_false }
      end
    end

end