require 'rails_helper'

RSpec.describe "Admin visits new categories page" do
  it "allows admin to create a new category" do

    admin = User.create(first_name: "brett", last_name: "schwartz", email: "bschwartz@example.com", password: "password", password_confirmation: "password", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_category_path

    fill_in "category[name]", with: "sports"
    click_on "Create Category"

    expect(current_path).to eq category_path(Category.last)
    expect(Gif.count).to eq 1
    expect(page).to have_content "sports gifs"
    expect(page).to have_css("iframe")
  end
end
