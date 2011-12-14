def login(username, password)
  visit "/webapp/index.html"
  fill_in 'j_username', :with => username
  fill_in 'j_password', :with => password
  find("#signInButton").click
end

#Given

Given /^I am on the home page$/ do
  visit "/webapp/index.html"
end

Given /^I have entered "([^"]*)" into the "([^"]*)" field$/ do |text, field|
  fill_in field, :with => text
end

#When

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

When /^I click on the button with id "([^"]*)"$/ do |button_text|
  find("#" << button_text).click
end

When /^I click on the "([^"]*)" link$/ do |link|
  find('a', :text => link).click
end

When /^I choose "([^"]*)" from the "([^"]*)" dropdown$/ do |dropDownValue, dropDownId|
  find_by_id(dropDownId).select(dropDownValue)
end

When /^I click on the "([^"]*)" checkbox$/ do |checkboxId|
  find("#"+checkboxId).click
end

When /^I see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

When /^I click on the "([^"]*)" link within the "([^"]*)" element$/ do |text, elementId|
  within('#' + elementId) do
    find('a', :text => text).click
  end
end

When /^I enter "([^"]*)" into the "([^"]*)" field in the "([^"]*)" frame$/ do |text, field, frameId|
  within_frame(frameId) do
    fill_in field, :with => text
  end
end

When /^I click on the "([^"]*)" button in the "([^"]*)" frame$/ do |text, frameId|
  within_frame(frameId) do
    click_button text
  end
end

#Then

Then /^I should see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

Then /^I should see "([^"]*)" in the "([^"]*)" element in the "([^"]*)" frame$/ do |text, elementId, frameId|
  within_frame(frameId) do
    within('#' + elementId) do
      page.should have_content(text)
    end
  end
end