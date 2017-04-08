require 'rails_helper'

describe Category do
  context "relationships" do
    it "has many gifs" do
        category = Category.create(name: "funny")

        expect(category).to respond_to(:gifs)
    end
  end
end
