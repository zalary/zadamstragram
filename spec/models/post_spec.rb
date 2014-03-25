require 'spec_helper'

describe Post do

  context "image urls" do
    
    before do
      @p = Post.create(pic_url: "http://placekitten.com.s3.amazonaws.com/homepage-samples/408/287.jpg")
    end
    it "has one image" do
      expect(@p.pic_url).to eq("http://placekitten.com.s3.amazonaws.com/homepage-samples/408/287.jpg")
    end

    before do
      @p2 = Post.create(pic_url: "http://placekitten.com.s3.amazonaws.com/homepage-samples/408/287.jpg", pic_url: "http://placekitten.com.s3.amazonaws.com/homepage-samples/200/287.jpg")
    end
    it "cannot have more than one" do
      expect(@p2.pic_url).to eq("http://placekitten.com.s3.amazonaws.com/homepage-samples/200/287.jpg")
    end
  end

  pending context "comments" do
    it "has one comment" do

    end

    it "has more than one comment" do

    end

  end

  pending context "likes" do
    it "has one like" do

    end

    it "has more than one like" do

    end

  end

end
