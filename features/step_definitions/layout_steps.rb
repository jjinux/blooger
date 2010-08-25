Then /^I should see the page header "([^\"]*)"$/ do |name|
  response.should have_selector("h2", :content => name)
end

Then /^I should see the flash message "([^"]+)"$/ do |message|
  response.should have_selector("#flash", :content => message, :count => 1)
end