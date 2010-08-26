Given /^there is only one post$/ do
  @user.posts.create!(:title => "One Post Title", :body => "One post body.")
end

Then /^I should see Markdown in strong tags$/ do
  response.should have_selector("strong", :content => "Markdown")
end