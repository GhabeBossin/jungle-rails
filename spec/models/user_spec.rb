require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do

    it 'is valid with all valid attributes' do
      @user = User.create(
        fname: 'Ghabe',
        lname: 'Bossin',
        email: 'gee.bossin@gmail.com',
        password: 'some_password',
        password_confirmation: 'some_password'
      )
      expect(@user).to be_valid
    end

    it 'is not valid without a fname' do
      @user.fname = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without a lname' do
      @user.lname = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without an email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without a password' do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'is not valid without a password_confirmation' do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end
  end

end
