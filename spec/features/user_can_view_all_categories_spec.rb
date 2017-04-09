require 'rails_helper'

RSpec.feature "User viewing all categories" do
  context "when viewing category index page" do
    it "user can see a hyperlink to all existing categories" do

      category1 = Category.create(name: "sports")
      category1.gifs.create(image_url: "http://giphy.com/embed/bKrynkeJjTKow", category_id: 1)
      category2 = Category.create(name: "funny")
      category3 = Category.create(name: "horror")

      visit categories_path

      expect(page).to have_content "sports"
      expect(page).to have_content "funny"
      expect(page).to have_content "horror"

      click_on("sports")

      expect(current_path).to eq(category_path(category1))
      expect(page).to have_css("iframe")
    end
  end
end
