require 'rails_helper'

describe Favorite do
  context "relationships" do
    it "has one gif" do

        favorite = Favorite.create(gif_id: 1, user_id: 1)

        expect(favorite).to respond_to(:gif)
    end
    it "has one user" do

        favorite = Favorite.create(gif_id: 1, user_id: 1)

        expect(favorite).to respond_to(:user)
    end
  end
end
