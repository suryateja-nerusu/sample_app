require 'rails_helper'

RSpec.describe User, type: :model do
	before {@user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")}
  

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "when name is not present", type: :model  do
    before { @user.name = " " }
    it { should_not be_valid }
end

  describe "when email is not present", type: :model do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when name is too long", type: :model do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when email format is invalid", type: :model do
    scenario "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "when email format is valid", type: :model do
    scenario "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end

  describe "when email address is already taken", type: :model do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" , type: :model do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation", type: :model do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil", type: :model do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "with a password that's too short", type: :model do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method", type: :model do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password", type: :model do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password", type: :model do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { expect(user_for_invalid_password).to eql(false) }
    end
  end

end
