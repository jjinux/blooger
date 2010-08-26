require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Post do
  it "can be added to a user" do
    user = Factory :user
    user.posts << Post.create!(:title => "Title", :body => "Body")
    user.save!
    post = user.posts.first
    post.title.should == "Title"
    post.body.should == "Body"
    Post.find_by_title!("Title").first.user.should == user
  end
end