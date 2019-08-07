require 'rails_helper'  #includes spec_helper gem

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe User do
  describe 'validations' do
    it { should validate_presence_of :username }
    # it { should validate_uniqueness_of :username }
    
    it { should validate_presence_of :session_token }
    # it { should validate_uniqueness_of :session_token }

    it { should validate_presence_of :password_digest }
  end

  # describe 'associations' do
  #   #should have goals and comments
  #   #goals and comments should link to users
  #   it { should have_many :goals }
  #   it { should have_many :comments }
  #   it { should have_many :cheers }
  # end

  describe 'class-methods' do

    #find by credentials
    it "should return a user with the provided credentials" do
      user = FactoryBot.create(:user)
      expect(User.find_by_credentials(
          user.username, user.password))
          .to eq(user)
    end

    #ensure session token
    it "should ensure a session token exists" do
      user = FactoryBot.create(:user)
      expect(user.session_token).to_not eq(nil)
    end

    #reset the user's session token
    it "should reset the user's session token" do
      user = FactoryBot.create(:user)
      original_session_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(original_session_token)
    end

    #generate session token
    it "should generate a session token" do
      user = FactoryBot.create(:user)
      expect(user.session_token).to_not eq(nil)
    end

    #password=
    it "should validate BCrypt password_digest is password" do
      user = FactoryBot.create(:user)
      expect(BCrypt::
        Password.new(user.password_digest)
        .is_password?(user.password)).to eq(true)
    end

    #is_password?
    it "should assign password to @password and password_digest shouldn't be null" do
      user = FactoryBot.create(:user)
      expect(user.is_password?(user.password)).to eq(true)
      
    end
  end
end