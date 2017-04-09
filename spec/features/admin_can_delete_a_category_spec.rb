require 'rails_helper'

RSpec.feature "Admin can delete a category" do
  context "when visiting the categories index page" do
    it "they click delete and remove category" do

      admin = User.create(first_name: "brett", last_name: "schwartz", email: "bschwartz@example.com", password: "password", password_confirmation: "password", role: 1)
      category = Category.create(name: "sports")
      gif = category.gifs.create(image_url: "http://giphy.com/embed/bKrynkeJjTKow", category_id: 1)
      user = User.create(first_name: "brett", last_name: "schwartz", email: "bschwartz@example.com", password: "password", password_confirmation: "password", role: 0)
      user.gifs << gif

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit categories_path

      click_on "Delete sports"

      expect(current_path).to eq(categories_path)
      expect(user.gifs.count).to eq 0
      expect(category.gifs.count).to eq 0
      expect(page).to_not have_link("sports")
    end
    it "they don't see a delete button" do

      admin = User.create(first_name: "brett", last_name: "schwartz", email: "bschwartz@example.com", password: "password", password_confirmation: "password", role: 1)
      category = Category.create(name: "sports")
      gif = category.gifs.create(image_url: "http://giphy.com/embed/bKrynkeJjTKow", category_id: 1)
      user = User.create(first_name: "brett", last_name: "schwartz", email: "bschwartz@example.com", password: "password", password_confirmation: "password", role: 0)
      user.gifs << gif

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit categories_path

      expect(page).to_not have_link("Delete sports")
    end
  end
end
