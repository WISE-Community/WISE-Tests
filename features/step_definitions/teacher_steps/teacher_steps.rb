

#Given

Given /^I am logged in as a teacher$/ do
  login($teacherLogin, $teacherPassword);
  page.should have_content("Teacher Home")
end

#When

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
