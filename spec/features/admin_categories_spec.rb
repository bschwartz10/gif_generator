require 'rails_helper'

RSpec.describe "User visits new categories page" do
  context "as admin" do
    it "allows admin to create a new category" do

      admin = User.create(first_name: "brett", last_name: "schwartz", email: "bschwartz@example.com", password: "password", password_confirmation: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_category_path

      expect(page).to have_content("Create a new category")

    end
  end

  context "as user" do
    it "doesn't allow user to create a new category" do

      user = User.create(first_name: "brett", last_name: "schwartz", email: "bschwartz@example.com", password: "password", password_confirmation: "password", role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_admin_category_path

      expect(page).to_not have_content("Create a new category")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
