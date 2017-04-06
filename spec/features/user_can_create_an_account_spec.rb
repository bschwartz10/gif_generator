require 'rails_helper'

RSpec.feature "User creating a new account" do
  context "when providing all information" do
    scenario "they logged in successfully" do

      visit new_user_path

      fill_in "user[first_name]", with: 'Brett'
      fill_in "user[last_name]", with: 'Schwartz'
      fill_in "user[email]", with: "bschwartz@example.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"


      click_on "Create Account"

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content("bschwartz@example.com")
      expect(page).to have_content("Successfully logged in!")
    end
  end
end
