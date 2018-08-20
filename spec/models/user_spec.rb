require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(
    first_name: "john",
    last_name: "doe",
    email: "john@doe.com",
    password: 'password1234',
    password_confirmation: 'password1234' ) }

  describe "Validations" do
    it "passwords should match" do
      subject.password = "xyz"
      expect(subject).to_not be_valid
    end
    it "is not valid without a password" do
      subject.password = nil
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end
    it "has unique email" do
      subject1 = described_class.create(
        first_name: "john", last_name: "doe",
        email: "john@doe.com", password: 'password1234',
        password_confirmation: 'password1234')
      subject2 = described_class.create(
          first_name: "jane", last_name: "doe",
          email: "john@doe.com", password: 'password1234',
          password_confirmation: 'password1234')
      expect(subject2.errors.full_messages.first).to eq("Email has already been taken")
    end
    it "has unique email (case insensitive)" do
      subject1 = described_class.create(
        first_name: "john", last_name: "doe",
        email: "JOHN@doe.com", password: 'password1234',
        password_confirmation: 'password1234')
      subject2 = described_class.create(
          first_name: "jane", last_name: "doe",
          email: "john@doe.com", password: 'password1234',
          password_confirmation: 'password1234')
      expect(subject2.errors.full_messages.first).to eq("Email has already been taken")
    end
    it "requires all attributes" do
      expect(subject).to be_valid
      expect(subject.errors.full_messages.first).to eq(nil)
    end
    it "has password with min length 5" do
      subject1 = described_class.create(
        first_name: "john", last_name: "doe",
        email: "JOHN@doe.com", password: 'abc',
        password_confirmation: 'abc')
      expect(subject1.errors.full_messages.first).to eq("Password is too short (minimum is 5 characters)")
    end
  end
  describe '.authenticate_with_credentials' do
    it 'sould authenticate with email/password' do
      user1 = described_class.create(
        first_name: "joe", last_name: "smith",
        email: "joe@smith.com", password: "password1234",
        password_confirmation: "password1234")
       auth_user = User.authenticate_with_credentials("joe@smith.com", "password1234")
      expect(auth_user).to eq(user1)
    end
    it 'sould authenticate with (case-insensitive) email/password' do
      user1 = described_class.create(
        first_name: "joe", last_name: "smith",
        email: "joe@smith.com", password: "password1234",
        password_confirmation: "password1234")
       auth_user = User.authenticate_with_credentials("joe@smith.COM", "password1234")
      expect(auth_user).to eq(user1)
    end
    it 'sould authenticate with (case-insensitive) email/password' do
      user1 = described_class.create(
        first_name: "joe", last_name: "smith",
        email: "joe@smith.com", password: "password1234",
        password_confirmation: "password1234")
       auth_user = User.authenticate_with_credentials("JOE@smith.COM", "password1234")
      expect(auth_user).to eq(user1)
    end
  end
end

