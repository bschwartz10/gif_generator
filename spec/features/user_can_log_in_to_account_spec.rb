require 'rails_helper'

RSpec.feature "User logging into account" do
  context "when providing all information" do
    scenario "successfully logs in" do

      user = User.create(first_name: "brett", last_name: "schwartz", email: "bschwartz@example.com", password: "password", password_confirmation: "password")

      visit login_path

      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: "password"

      click_on "Log In"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content "bschwartz@example.com"
      expect(page).to have_content "Log In Successful"

    end
  end

  context "when providing insufficient information" do
    scenario "they are sent back to the login page" do
      user = User.create(first_name: "brett", last_name: "schwartz", email: "bschwartz@example.com", password: "password", password_confirmation: "password")

      visit login_path

      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: ""

      click_on "Log In"

      expect(current_path).to eq(login_path)
      expect(page).to have_content "Unsuccessful Log In"
  
    end
  end
end
