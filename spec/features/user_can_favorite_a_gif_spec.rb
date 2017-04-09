require 'rails_helper'

RSpec.describe "User visits a categories show page" do
  context "it allows them to favorite a gif" do
    xit "expects gif to show up on user show page" do
      category = Category.create(name: "sports")
      gif = (Gif.create(image_url: "http://giphy.com/embed/bKrynkeJjTKow", category_id: 1))
      user = User.create(first_name: "brett", last_name: "schwartz", email: "bschwartz@example.com", password: "password", password_confirmation: "password", role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit category_path(category)

      click_on "Add to favorites"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_css("iframe")
      expect(user.favorites.count).to eq 1
    end
  end
end
