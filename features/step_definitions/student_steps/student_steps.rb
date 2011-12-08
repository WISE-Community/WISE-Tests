
#Given

Given /^I am logged in as a student$/ do
  login($studentLogin, $studentPassword);
  page.should have_content("Student Home")
end

#When

When /^I launch run "([^"]*)"$/ do |runId|
  find_by_id(runId).click
end

When /^I click on Step "([^"]*)" in the VLE navigation menu$/ do |stepPosition|
  #split the step position by .
  positions = stepPosition.split('.');

  #loop through all the position parts and decrement by one  
  for i in 0..(positions.length - 1)
    positions[i] = positions[i].to_i - 1;
  end

  #get the activity number and step number
  #activity 1 will be 0
  #step 1 will be 0 
  activity = positions[0];
  step = positions[1];

  #look in the topifrm  
  within_frame("topifrm") do
    #find the acitivity div
    within("#" + activity.to_s) do
      #find all the a links in this activity div
      stepLinks = all("a");
      
      #click on the ith step
      stepLinks[step.to_i].click;
    end
  end
end

When /^I see the project name "([^"]*)" in the VLE$/ do |projectName|
  within_frame("topifrm") do 
    find_by_id("title").has_content?(projectName)
  end
end

When /^I click on the "([^"]*)" link in the VLE$/ do |linkText|
  within_frame("topifrm") do 
    find('a', :text => linkText).click
  end
end

When /^I see "([^"]*)" in the step$/ do |text|
  within_frame("topifrm") do 
    within_frame("ifrm") do 
      page.should have_content(text)
    end
  end
end

When /^I see the element with id "([^"]*)" in the step$/ do |elementId|
  within_frame("topifrm") do 
    within_frame("ifrm") do 
      page.should have_selector("#" + elementId)
    end
  end
end

When /^I enter "([^"]*)" into the "([^"]*)" in the step$/ do |text, elementId|
  within_frame("topifrm") do 
    within_frame("ifrm") do 
      page.fill_in elementId, :with => text
    end
  end
end

#Then

Then /^I should see "([^"]*)" in the VLE$/ do |text|
  within_frame("topifrm") do 
    page.should have_content(text)
  end
end

Then /^I should see the div with id "([^"]*)" in the VLE$/ do |divId|
  within_frame("topifrm") do 
    page.should have_selector('#' << divId)
  end
end

Then /^I should see "([^"]*)" in the step$/ do |text|
  within_frame("topifrm") do 
    within_frame("ifrm") do 
      page.should have_content(text)
    end
  end
end

Then /^I should not see the project name in the VLE$/ do
  within_frame("topifrm") do
    find_by_id("title").should_not be_visible
  end
end

Then /^I should see "([^"]*)" in the Idea Basket in the VLE$/ do |text|
  within_frame("topifrm") do 
    within_frame("ideaBasketIfrm") do 
      page.should have_content(text)
    end
  end
end

Then /^I should see "([^"]*)" in the element with id "([^"]*)" in the step$/ do |text, elementId|
  within_frame("topifrm") do 
    within_frame("ifrm") do 
      page.should have_selector("#" + elementId, :content => text)
    end
  end
end
