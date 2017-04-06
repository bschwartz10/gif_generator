require 'rails_helper'

describe User do
  it "user can be created as an admin" do

    user = User.create(first_name: "brett", last_name: "schwartz", email: "bschwartz@example.com", password: "password", password_confirmation: "password", role: 1)

    expect(user.role).to eq("admin")
    expect(user.admin?).to be_truthy
  end

  it "user can be created as default" do

    user = User.create(first_name: "brett", last_name: "schwartz", email: "bschwartz@example.com", password: "password", password_confirmation: "password", role: 0)

    expect(user.role).to eq("default")
    expect(user.admin?).to be_falsey
  end
end
