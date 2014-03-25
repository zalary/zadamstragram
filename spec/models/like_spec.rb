require 'spec_helper'

describe Like do
    context "likes" do

    before do
      @p = Post.create(pic_url: "http://placekitten.com.s3.amazonaws.com/homepage-samples/200/287.jpg", user_id: 1)
      @pid = @p.id
      @l = Like.create(user_id: 1, post_id: @pid)
    end

    it "should have a user_id and a photo_id" do
      expect(@p.like.user_id).to eq([1])
      expect(@p.like.photo_id).to eq(@pid)
      #expect(@c.text).to eq
    end


   pending it "has more than one comment" do

      @c2 = Comment.create(text: "Totally Awesome", post_id: @pid)

      expect(@p.comments).to eq([@c,@c2])
      expect(@p.comments[1].text).to eq("Totally Awesome")
    end
  end
end
