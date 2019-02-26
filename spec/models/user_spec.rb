require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject {
    described_class.new(
      fname: 'Corgo',
      lname: 'Doggerson',
      email: 'hot.dog@gmail.com',
      password: 'some_password',
      password_confirmation: 'some_password'
    )
  }

  describe 'Validations' do

    #all pass validation

    it 'is valid with all valid attributes' do
      expect(subject).to be_valid
    end

    # presence validations

    it 'is not valid without a fname' do
      subject.fname = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a lname' do
      subject.lname = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a password_confirmation' do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end

    #password validity

    it 'is valid when the password and password_confirmation are the same' do
      expect(subject.password).to eql(subject.password_confirmation)
    end

    it 'is not valid when the password and password_confirmation are different' do
      subject.password_confirmation = 'some-passw0rd'
      expect(subject.password).to_not eql(subject.password_confirmation)
    end

    it 'is valid when the password is at least 6 characters' do
      subject.password = 'cat123'
      expect(subject).to_not be_valid
    end

    it 'is not valid when the password is less than 6 characters' do
      subject.password = 'cat12'
      expect(subject).to_not be_valid
    end

    #email validity

    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  # user validation

  describe '.authenticate_with_credentials' do
    it 'is valid instance of the user if successfully authenticated' do
      @user = User.new(
        fname: 'Doggo',
        lname: 'Doggerson',
        email: 'dig.dog@gmail.com',
        password: 'bone-sniffer',
        password_confirmation: 'bone-sniffer'
      )
      @user.save!

      @user2 = User.new(
        fname: 'Doggo',
        lname: 'Doggerson',
        email: ' dig.Dog@gmail.com',
        password: 'bone-sniffer',
        password_confirmation: 'bone-sniffer'
      )
      @user2.save!

      expect(User.authenticate_with_credentials(@user.email, @user.password)).to be_truthy
      expect(User.authenticate_with_credentials(@user2.email, @user2.password)).to be_truthy
    end

    it 'is not valid if not successfully authenticated' do
      expect(User.authenticate_with_credentials(subject.email, 's0me-p4ssword')).to be nil
      expect(User.authenticate_with_credentials('fat.cat@gmail.com', subject.password)).to be nil
    end

  end


end
