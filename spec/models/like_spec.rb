require 'spec_helper'

describe Like do
    context "likes" do

    before do
      @p = Post.create(pic_url: "http://placekitten.com.s3.amazonaws.com/homepage-samples/200/287.jpg", user_id: 1)
      @pid = @p.id
      @l = Like.create(user_id: 1, post_id: @pid)
    end

    it "should have a user_id and a photo_id" do
      expect(@p.likes.first.user_id).not_to be_nil
      expect(@p.likes.first.post_id).not_to be_nil
      #expect(@c.text).to eq
    end


  end
end
