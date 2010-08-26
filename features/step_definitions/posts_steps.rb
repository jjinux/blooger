Given /^there is only one post$/ do
  @user.posts.create!(:title => "One Post Title", :body => "One post body.")
end