require 'rails_helper'

describe Gif do
  context "relationships" do
    it "has one category" do

      gif = Gif.create(image_url: "http://giphy.com/embed/bKrynkeJjTKow", category_id: 1)

      expect(gif).to respond_to(:category)
    end

    it "has many users" do
      gif = Gif.create(image_url: "http://giphy.com/embed/bKrynkeJjTKow", category_id: 1)

      expect(gif).to respond_to(:users)
    end
  end
end
