require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Post do
  it "can be added to a user" do
    user = Factory :user
    user.posts.create!(:title => "Title", :body => "Body")
    post = Post.first
    post.title.should == "Title"
    post.body.should == "Body"
    post.user.should == user
  end
end