require 'rails_helper'

RSpec.describe "User visits a user show page" do
  context "it allows them to unfavorite a gif" do
    it "expects gif to be removed from show page" do

      category = Category.create(name: "sports")
      gif = (Gif.create(image_url: "http://giphy.com/embed/bKrynkeJjTKow", category_id: 1))
      user = User.create(first_name: "brett", last_name: "schwartz", email: "bschwartz@example.com", password: "password", password_confirmation: "password", role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit category_path(category)
      click_on "Add to favorites"

      visit user_path(user)
      click_on "Remove from favorites"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("You unfavorited a #{category.name}'s gif!")
      expect(user.gifs.count).to eq 0
    end
  end
end
