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

Given /^I am on the teacher home page$/ do
  visit "/webapp/teacher/index.html"
end

Given /^I have entered "([^"]*)" into the "([^"]*)" field$/ do |text, field|
  fill_in field, :with => text
end

Given /^I have entered runCode2 into the "([^"]*)" field$/ do |field|
  fill_in field, :with => $runCode2
end

#When

When /^I log in as student1$/ do
  login($studentLogin1, $studentPassword1)
end

When /^I log in as teacher1$/ do
  login($teacherLogin1, $teacherPassword1)
end

When /^I log in as an admin$/ do
  login($adminLogin, $adminPassword)
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
  sleep 5
  if(link == '$projectId1')
    link = $projectId1
  elsif(link == '$studentLogin1')
    link = $studentLogin1
  end
  first('a', :text => link).click
end

When /^I choose "([^"]*)" from the "([^"]*)" dropdown$/ do |dropDownValue, dropDownId|
  find_by_id(dropDownId).find("option[value='" + dropDownValue + "']").click
end

When /^I click on the "([^"]*)" checkbox$/ do |checkboxId|
  find("#"+checkboxId).click
end

When /^I see "([^"]*)"$/ do |text|
  page.should have_content(text)
end

When /^I click on the "([^"]*)" link within the "([^"]*)" element$/ do |text, elementId|
  within('#' + elementId) do
    first('a', :text => text).click
  end
end

When /^I click on the first link with class "([^"]*)" within the "([^"]*)" element$/ do |className, elementId|
  within('#' + elementId) do
    first('.' + className).click
  end
end

When /^I enter "([^"]*)" into the "([^"]*)" field in the "([^"]*)" frame$/ do |text, field, frameId|
  if(text == '$teacherLogin1')
    text = $teacherLogin1
  end

  if(text == '$teacherLogin2')
    text = $teacherLogin2
  end
  
  within_frame(frameId) do
    fill_in field, :with => text
  end
end

When /^I click on the "([^"]*)" button in the "([^"]*)" frame$/ do |text, frameId|
  within_frame(frameId) do
    click_button text
  end
end

When /^I enter "([^"]*)" into the "([^"]*)" field$/ do |text, elementId|
  if(text == '$teacherLogin1')
    text = $teacherLogin1
  elsif(text == '$studentLogin1')
    text = $studentLogin1
  end
  fill_in elementId, :with => text
end

When /^if I see a popup then I click OK$/ do
  #this will try to switch to the alert and accept it
  #if there is no alert it will throw an exception which
  #we will catch. we should really be catching the 
  #NoAlertPresentError but I keep receiving this error
  #when I try to do so
  #uninitialized constant Capybara::Selenium::WebDriver (NameError)
  #the NoAlertPresentError should be found at this path
  #Selenium::WebDriver::Error::NoAlertPresentError
  page.driver.browser.switch_to.alert.accept rescue Exception
end

When /^I refresh the page$/ do
  visit [ current_path, page.driver.request.env['QUERY_STRING'] ].reject(&:blank?).join('?')
end

When /^I wait "([^"]*)" seconds$/ do |seconds|
  sleep seconds.to_i
end

#Then

Then /^I should see "([^"]*)"$/ do |text|
  if(text == '$projectId1')
    text = $projectId1
  end
  page.should have_content(text)
end

Then /^I should see "([^"]*)" in the "([^"]*)" element in the "([^"]*)" frame$/ do |text, elementId, frameId|
  if(text == '$teacherLogin1')
    text = $teacherLogin1
  end

  if(text == '$teacherLogin2')
    text = $teacherLogin2
  end
  
  within_frame(frameId) do
    within('#' + elementId) do
      page.should have_content(text)
    end
  end
end

Then /^I should see the "([^"]*)" element$/ do |elementId|
  page.should have_selector('#' + elementId)
end