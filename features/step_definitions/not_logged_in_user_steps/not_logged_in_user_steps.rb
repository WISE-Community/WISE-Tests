Given /^I am on the Student Registration page$/ do
  visit "/webapp/student/registerstudent.html"
end

Given /^I am on the Teacher Registration page$/ do
  visit "/webapp/teacher/registerteacher.html"
end

When /^if I see "([^"]*)" then I click on "([^"]*)"$/ do |content, linkText|
  if(page.has_content?(content))
    find('a', :text => linkText).click
  end
end