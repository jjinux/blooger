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

  it "enforces referential integrity" do
    lambda do
      Post.create!(:title => "Title", :body => "Body") do |p|
        p.user_id = 99
      end
    end.should raise_error(ActiveRecord::StatementInvalid)
  end
end