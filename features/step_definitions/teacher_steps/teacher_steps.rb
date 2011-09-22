teacherLogin = "aa"
teacherPassword = "a"

def login(username, password)
  visit "/webapp/index.html"
  fill_in 'j_username', :with => username
  fill_in 'j_password', :with => password
  find("#signInButton").click
  page.should have_content("Teacher Home")
end

#Given

Given /^I am logged in as a teacher$/ do
  login(teacherLogin, teacherPassword);
end

#When

When /^I click on the "([^"]*)" link$/ do |link|
  find('a', :text => link).click
end

When /^I click on the "([^"]*)" button in the Authoring Tool$/ do |buttonText|
  within_frame("authorfrm") do
    find_by_id(buttonText).click
  end
end

When /^I choose project "([^"]*)" from the "([^"]*)" dropdown in the Authoring Tool$/ do |dropDownValue, arg2|
  within_frame("authorfrm") do
    find_by_id("selectProject").select(dropDownValue)
  end
end

#Then

Then /^I should see "([^"]*)" in the Authoring Tool$/ do |text|
  within_frame("authorfrm") do 
    page.should have_content(text)
  end
end

Then /^I should see project "([^"]*)" loaded in the Authoring Tool$/ do |projectId|
  within_frame("authorfrm") do
    find_by_id("projectID").has_content?(projectId)
  end
end
