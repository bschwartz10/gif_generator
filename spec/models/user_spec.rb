require 'rails_helper'

describe User do
  context "admin functionality" do
    it "user can be created as an admin" do

      user = User.create(first_name: "brett", last_name: "schwartz", email: "bschwartz@example.com", password: "password", password_confirmation: "password", role: 1)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end

    it "user can be created as default" do

      user = User.create(first_name: "brett", last_name: "schwartz", email: "bschwartz@example.com", password: "password", password_confirmation: "password", role: 0)

      expect(user.role).to eq("default")
      expect(user.admin?).to be_falsey
    end
  end

  context "validations" do
    it "is invalid without a first_name" do
      user = User.create(last_name: "schwartz", email: "bschwartz@example.com", password: "password", password_confirmation: "password", role: 0)
      expect(user).to be_invalid
    end

    it "is invalid without a last_name" do
      user = User.create(first_name: "Brett", email: "bschwartz@example.com", password: "password", password_confirmation: "password", role: 0)
      expect(user).to be_invalid
    end

    it "is invalid without an email" do
      user = User.create(first_name: "Brett", last_name: "schwartz", password: "password", password_confirmation: "password", role: 0)
      expect(user).to be_invalid
    end

    it "is invalid without a password" do
      user = User.create(first_name: "Brett", last_name: "schwartz", email: "bschwartz@example.com", password_confirmation: "password", role: 0)
      expect(user).to be_invalid
    end

    it "is invalid without a password_confirmation" do
      user = User.create(first_name: "Brett", last_name: "schwartz", email: "bschwartz@example.com", password: "password", role: 0)
      expect(user).to be_invalid
    end

    it "is invalid without a role" do
      user = User.create(first_name: "Brett", last_name: "schwartz", email: "bschwartz@example.com", password: "password")
      expect(user).to be_invalid
    end

    it "is valid without a role" do
      user = User.create(first_name: "brett", last_name: "schwartz", email: "bschwartz@example.com", password: "password", password_confirmation: "password", role: 0)
      expect(user).to be_valid
    end

    it "has a unique email" do
      user1 = User.create(first_name: "brett", last_name: "schwartz", email: "bschwartz@example.com", password: "password", password_confirmation: "password", role: 0)
      user2 = User.create(first_name: "brett", last_name: "schwartz", email: "bschwartz@example.com", password: "password", password_confirmation: "password", role: 0)

      expect(user2).to be_invalid
    end

  end
end
