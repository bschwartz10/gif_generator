require 'rails_helper'

RSpec.describe "Admin visits categories index page" do
  context "as admin" do
    it "allows admin to see all categories" do

      admin = User.create(first_name: "brett", last_name: "schwartz", email: "bschwartz@example.com", password: "password", password_confirmation: "password", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)


    end
  end
end
