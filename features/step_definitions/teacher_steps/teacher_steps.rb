

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

When /^I click on the "([^"]*)" "([^"]*)" Grading Tool link$/ do |gradeBy, revisions|
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

When /^I see "([^"]*)" in the Grading Tool$/ do |text|
  within_frame("gradingIfrm") do
    within_frame("topifrm") do
      page.should have_content(text)
    end
  end
end

When /^period "([^"]*)" is selected$/ do |period|
  within_frame("gradingIfrm") do
    within_frame("topifrm") do
      if period == "All Periods"
        periodId = "all"
      else
        periodId = period.downcase.gsub(/ /, '')
      end
      page.should have_css('#' + periodId + '.checked')
    end
  end
end

When /^I click on period "([^"]*)"$/ do |period|
  within_frame("gradingIfrm") do
    within_frame("topifrm") do
      if period == "All Periods"
        periodId = "all"
      else
        periodId = period.downcase.gsub(/ /, '')
      end
      find_by_id(periodId).click
    end
  end
end

When /^I click on Step "([^"]*)" in the Grading Tool$/ do |stepPosition|
  within_frame("gradingIfrm") do
    within_frame("topifrm") do
      #click_link(stepPosition)
      find('a', :text => stepPosition).click
    end
  end
end

#TODO: make this more precise
When /^I give a student a score of "([^"]*)" in the Grading Tool$/ do |score|
  within_frame("gradingIfrm") do
    within_frame("topifrm") do
      elements = page.all('input', :type => 'text');
      
      elements.each { |element|
      	if element[:type] == 'text' and element[:disabled] == 'false'
      	  element.set(score)
      	  break
      	end
      }
    end
  end
end

When /^I give a student a comment of "([^"]*)" in the Grading Tool$/ do |comment|
  within_frame("gradingIfrm") do
    within_frame("topifrm") do
      elements = page.all('textarea');
      
      elements.each { |element|
      	if element[:disabled] == 'false'
      	  element.set(comment)
      	  break
      	end
      }
    end
  end
end

When /^I click on the "([^"]*)" link in the Grading Tool$/ do |link|
  within_frame("gradingIfrm") do
    within_frame("topifrm") do
      page.find('a', :text => link).click
    end
  end
end

When /^I close the Grading Tool$/ do
  page.find('span', :text => 'close').click
end

When /^I click on the student "([^"]*)" in the Grading Tool$/ do |studentLogin|
  within_frame("gradingIfrm") do
    within_frame("topifrm") do
      page.find('a', :text => studentLogin).click
    end
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

Then /^period "([^"]*)" should be selected$/ do |period|
  within_frame("gradingIfrm") do
    within_frame("topifrm") do
      if period == "All Periods"
        periodId = "all"
      else
        periodId = period.downcase.gsub(/ /, '')
      end
      page.should have_css('#' + periodId + '.checked')
    end
  end
end

#TODO: make this more precise
Then /^I should see a student with a score of "([^"]*)" in the Grading Tool$/ do |score|
  within_frame("gradingIfrm") do
    within_frame("topifrm") do
      elements = page.all('input', :type => 'text');
      
      elements.each { |element|
      	if element[:type] == 'text' and element[:disabled] == 'false'
      	  element.value.should == score
      	  break
      	end
      }
    end
  end
end

#TODO: make this more precise
Then /^I should see a student with a comment of "([^"]*)" in the Grading Tool$/ do |comment|
  within_frame("gradingIfrm") do
    within_frame("topifrm") do
      elements = page.all('textarea');
      
      elements.each { |element|
      	if element[:disabled] == 'false'
      	  element.value.should == comment
      	  break
      	end
      }
    end
  end
end

Then /^I should see the Premade Comments window open$/ do
  within_window(page.driver.browser.window_handles.last) do
    page.should have_content("Global Premade Comment List")
  end
end