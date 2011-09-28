Given /^I am on the Student Registration page$/ do
  visit "/webapp/student/registerstudent.html"
end


When /^I choose "([^"]*)" from the "([^"]*)" dropdown$/ do |dropDownValue, dropDownId|
  find_by_id(dropDownId).select(dropDownValue)
end