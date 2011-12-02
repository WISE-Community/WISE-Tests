

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

When /^I click on the "([^"]*)" link and say OK to the warning$/ do |link|
  #capybara can't handle confirm dialog popups so we will just override the confirm function to always return true so we can move on with the test
  page.evaluate_script('window.confirm = function() { return true; }')
  find('a', :text => link).click
end

When /^I click on the "([^"]*)" "([^"]*)" link$/ do |gradeBy, revisions|
  gradingType = "";
  getRevisions = "";

  if gradeBy == "Grade by Step"
  	gradingType = "gradingType=step";
  	if revisions == "Latest Work"
	  getRevisions = "getRevisions=false";
  	elsif revisions == "All Revisions"
  	  getRevisions = "getRevisions=true";
  	end
  elsif gradeBy == "Grade by Team"
    gradingType = "gradingType=team";
  	if revisions == "Latest Work"
  	  getRevisions = "getRevisions=false";
  	elsif revisions == "All Revisions"
  	  getRevisions = "getRevisions=true";
  	end
  end
  
  counter = 0;
  elements = page.all('a', :text => revisions);
  foundElement = false;
  
  if elements.length > 0
    #we found some elements
    until foundElement do
      element = elements[counter];

      if element[:id].include? gradingType and element[:id].include? getRevisions
        #we have found an element that we want so we will click on it
        element.click;
        foundElement = true;
      end

      counter += 1;
    
      if counter > elements.length - 1
        #we have looped through all the elements but did not find any that we wanted
        return false;
      end
    end
  else
    #we did not find any elements
    return false;
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

Then /^I should see the preview window open$/ do
  within_window(page.driver.browser.window_handles.last) do
    within_frame("topifrm") do 
      page.should have_selector('#contentDiv')
  	end
  end
end

Then /^in the "([^"]*)" iframe I should see "([^"]*)"$/ do |popupName, text|
  if popupName == "Edit Run Settings"
    within_frame("editIfrm") do 
      page.should have_content(text)
    end
  elsif popupName == "Researcher Tools"
    within_frame("gradingIfrm") do
      within_frame("topifrm") do
        page.should have_content(text)
      end
    end
  end
end

Then /^I should see "([^"]*)" in the Grading Tool$/ do |text|
  within_frame("gradingIfrm") do
    within_frame("topifrm") do
      page.should have_content(text)
    end
  end
end
