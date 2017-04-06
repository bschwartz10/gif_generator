require 'rails_helper'

RSpec.feature "User logging out of account" do
  context "when clicking log out" do
    scenario "successfully logs out" do

      user = User.create(email: "bschwartz@example.com", password: "password")

      visit login_path

      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: "password"

      click_on "Log In"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content "bschwartz@example.com"
      expect(page).to have_content "Log In Successful"

      click_on "Log Out"

      expect(current_path).to eq(login_path)

    end
  end
end
