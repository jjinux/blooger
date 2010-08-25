# Call user_factory and set @user.
#
# Options:
#
# * <tt>as_user</tt> - This gets passed to user_factory.
def user(options = {})
  as_user = options[:as_user] || :user
  @user = user_factory(as_user)
end

# Login, assuming we're already on the login page.
#
# Options:
#
# * <tt>blank_password</li> - Don't set the password.
#
# Other options get passed to <tt>user</tt>.
def login_on_the_current_page(options = {})
  user(options)
  fill_in "Username", :with => @user.username
  unless options[:blank_password]
    fill_in "Password", :with => @user.password
  end
  click_button "Login"
  unless options[:blank_password]
    response.should contain("Login successful!")
    response.should contain("Logout")
  end
end

# Go to the login page and login.
#
# options get passed to login_on_the_current_page.
def login(options = {})
  visit new_user_session_path
  login_on_the_current_page(options)
end

Given /^I am a registered user$/ do
  user
end

When /^I try to login with a blank password on the current page$/ do
  login_on_the_current_page(:blank_password => true)
end

When /^I login on the current page$/ do
  login_on_the_current_page
end

When /^I login$/ do
  login
end

Given /^I am logged in$/ do
  login
end

Given /^I am not logged in$/ do
end

Given /^I am logged in as "([^"]+)"$/ do |as_user|
  login(:as_user => as_user.to_sym)
end

When /^I get redirected to the login page$/ do
  response.should contain("Username")
  response.should contain("Password")
end

When /^I login as "([^"]+)" \(on the current page\)$/ do |user|
  login_on_the_current_page(:as_user => user.to_sym)
end

When /^I try to view the login form$/ do
  visit new_user_session_path
end