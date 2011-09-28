Given /^I am on the Student Registration page$/ do
  visit "/webapp/student/registerstudent.html"
end

Given /^I am on the Teacher Registration page$/ do
  visit "/webapp/teacher/registerteacher.html"
end

When /^I choose "([^"]*)" from the "([^"]*)" dropdown$/ do |dropDownValue, dropDownId|
  find_by_id(dropDownId).select(dropDownValue)
end


When /^I click on the "([^"]*)" checkbox$/ do |checkboxId|
  find("#"+checkboxId).click
end
