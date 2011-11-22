def login(username, password)
  visit "/webapp/index.html"
  fill_in 'j_username', :with => username
  fill_in 'j_password', :with => password
  find("#signInButton").click
end

Given /^I am on the home page$/ do
  visit "/webapp/index.html"
end

Given /^I have entered "([^"]*)" into the "([^"]*)" field$/ do |text, field|
  fill_in field, :with => text
end

When /^I log in as a student$/ do
  login($studentLogin, $studentPassword);
end

When /^I log in as a teacher$/ do
  login($teacherLogin, $teacherPassword);
end

When /^I log in as an admin$/ do
  login($adminLogin, $adminPassword);
end


When /^I click the Sign In button$/ do
  find("#signInButton").click
end

When /^I click on the "([^"]*)" button$/ do |button_text|
  click_button button_text
end

When /^I click on the "([^"]*)" link$/ do |link|
  find('a', :text => link).click
end

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end
