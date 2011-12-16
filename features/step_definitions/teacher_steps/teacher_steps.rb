
#############
### Given ###
#############

Given /^I am logged in as a teacher$/ do
  login($teacherLogin1, $teacherPassword1);
  page.should have_content("Teacher Home")
end

#############
### When ####
#############

When /^I click on the "([^"]*)" button in the Authoring Tool$/ do |text|
  within_frame("authorfrm") do
    #capybara can't handle confirm dialog popups so we will just override the confirm function to always return true so we can move on with the test
    page.evaluate_script('window.confirm = function() { return true; }')
    click_button(text)
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

#click on the grading link
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
        #make everything lowercase and remove all spaces
        periodId = period.downcase.gsub(/ /, '')
      end
      
      #make sure the period is selected
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
        #make everything lowercase and remove all spaces
        periodId = period.downcase.gsub(/ /, '')
      end
      find_by_id(periodId).click
    end
  end
end

#click on the given step in the grading tool
When /^I click on Step "([^"]*)" in the Grading Tool$/ do |stepPosition|
  within_frame("gradingIfrm") do
    within_frame("topifrm") do
      find('a', :text => stepPosition).click
    end
  end
end

#TODO: make this more precise
When /^I give a student a score of "([^"]*)" in the Grading Tool$/ do |score|
  within_frame("gradingIfrm") do
    within_frame("topifrm") do
      #get all the text input elements
      elements = page.all('input', :type => 'text');
      
      #loop through all the elements
      elements.each { |element|
        #check that the type is text and the element is enabled
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
        #check that the element is enabled
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

When /^I see "([^"]*)" in the Authoring Tool$/ do |text|
  within_frame("authorfrm") do 
    page.should have_content(text)
  end
end

When /^I see the "([^"]*)" popup in the Authoring Tool$/ do |elementId|
  within_frame("authorfrm") do 
    find('#' + elementId).visible?.should == true
  end
end

When /^I should not see the "([^"]*)" popup in the Authoring Tool$/ do |elementId|
  within_frame("authorfrm") do 
    find('#' + elementId).visible?.should == false
  end
end

When /^I enter "([^"]*)" into the "([^"]*)" field in the Authoring Tool$/ do |text, elementId|
  within_frame("authorfrm") do 
    find_by_id(elementId).set(text)
  end
end

When /^I enter a unique value starting with "([^"]*)" into the "([^"]*)" field in the Authoring Tool$/ do |text, elementId|
  within_frame("authorfrm") do 
    #get the current time
    time = Time.now
    
    #get the time in milliseconds
    text += " " + time.to_i.to_s
    
    #remember the input value so we can refer to it in future steps
    $tempInputValue = text
    
    find_by_id(elementId).set(text)
  end
end

#select an option from a select box
#optionValue can be the text value of an option or the index
#of the option in the select box or "first" or "last" for
#the respective first or last elements in the select box
When /^I select the element "([^"]*)" in group name "([^"]*)" in the "([^"]*)" select box in the Authoring Tool$/ do |optionValue, groupName, elementId|
  within_frame("authorfrm") do 

    #get all the option elements
    options = page.all('option')
    
    optionToSelect = nil
    
    #loop through all the option elements
    options.each { |option|
      #find the option elements for the select box
      if option[:name] == groupName
        #check if we have found the option with the value we want
        if option.value == optionValue || option.text == optionValue
          #we have found the value so we will break out of the loop
          optionToSelect = option
          break
        end
      end
    }
    
    if optionToSelect == nil
      #we did not find the option by value so we will try to find it by index or first or last
      
      counter = 0
      
      #loop through all the option elements
      options.each { |option|
        #find the option elements for the select box
        if option[:name] == groupName

          if optionValue == 'first'
            #we want the first option
            optionToSelect = option
            break;
          elsif optionValue == 'last'
            #we want the last option
            optionToSelect = option
          elsif optionValue.to_i.to_s == optionValue
            #we want the option at the specific index
            if optionValue.to_i == counter
              optionToSelect = option
              break;
            end
          end
          
          counter += 1
        end
      }    
    end
    
    #puts optionToSelect.text
    page.select optionToSelect.text, :from => elementId
  end
end

When /^I click on the element with id "([^"]*)" in the Authoring Tool$/ do |elementId|
  within_frame("authorfrm") do 
    find("#" + elementId).click
  end
end

When /^I click on the "([^"]*)" activity in the Authoring Tool$/ do |arg1|
  within_frame("authorfrm") do
    puts find('.master')[:id]
    find('.master').click
  end
end

When /^I click on the master node in the Authoring Tool$/ do
  within_frame("authorfrm") do
    find('.master').click
  end
end

When /^I click on the first activity in the Authoring Tool$/ do
  within_frame("authorfrm") do
    find('.seq').click
  end
end

When /^I select the first activity in the Authoring Tool$/ do
  within_frame("authorfrm") do
    #get the first activity elements
    seqDiv = find('.seq')
    
    #get the checkbox
    selectCheckBox = seqDiv.all('input')[0]
    selectCheckBox.click
    
    #get the title of the activity
    titleInput = seqDiv.all('input')[1]
    $tempInputValue = titleInput.value
    
    #get the number of activities
    activities = page.all('.seq')
    $tempActivityCount = activities.length
  end
end

When /^I click on the second activity in the Authoring Tool$/ do
  within_frame("authorfrm") do
    seqDivs = page.all('.seq')
    seqDiv = seqDivs[1]
    seqDiv.click
  end
end

When /^I select the first step in the Authoring Tool$/ do
  within_frame("authorfrm") do
    #get the step
    stepDiv = find('.node')
    
    #get thecheckbox
    selectCheckBox = stepDiv.all('input')[0]
    selectCheckBox.click
    
    #get the title of the step
    titleInput = stepDiv.all('input')[1]
    $tempInputValue = titleInput.value
    
    #get the number of steps
    steps = page.all('.node')
    $tempStepCount = steps.length
  end
end

When /^I click on the second step in the Authoring Tool$/ do
  within_frame("authorfrm") do
    #get all the steps
    stepDivs = page.all('.node')
    
    #get the seconds step
    stepDiv = stepDivs[1]
    stepDiv.click
  end
end

When /^I click edit on the first step in the Authoring Tool$/ do
  within_frame("authorfrm") do
    #get the first Edit button
    editButton = find('.editNodeInput')
    editButton.click
  end
end

When /^I count the number of projects with the title "([^"]*)"$/ do |projectTitle|
  #get all the project title input elements
  projectTitleInputs = page.all('.projectTitle')
  projectCount = 0
  
  #loop through all the title elements
  projectTitleInputs.each { |titleInput|
    #check if the title matches
    if titleInput.text == projectTitle
      #it matches so we will increment our counter
      projectCount += 1
    end
  }
  
  #remember the count so we can reference it later
  $tempProjectCount = projectCount
end

#############
### Then ####
#############

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
  #check within the new window
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
        #make everything lowercase and remove all spaces
        periodId = period.downcase.gsub(/ /, '')
      end
      
      #make sure the period is selected
      page.should have_css('#' + periodId + '.checked')
    end
  end
end

#TODO: make this more precise
Then /^I should see a student with a score of "([^"]*)" in the Grading Tool$/ do |score|
  within_frame("gradingIfrm") do
    within_frame("topifrm") do
      #get all the text inputs
      elements = page.all('input', :type => 'text');
      
      elements.each { |element|
        #make sure the element is type text and is enabled
      	if element[:type] == 'text' and element[:disabled] == 'false'
      	  #compare the score
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
      #get all the textarea elemens
      elements = page.all('textarea');
      
      elements.each { |element|
        #make sure the element is enabled
      	if element[:disabled] == 'false'
      	  #compare the comment
      	  element.value.should == comment
      	  break
      	end
      }
    end
  end
end

Then /^I should see the Premade Comments window open$/ do
  #check within the new window
  within_window(page.driver.browser.window_handles.last) do
    page.should have_content("Global Premade Comment List")
  end
end

Then /^I should see "([^"]*)" in the "([^"]*)" field in the Authoring Tool$/ do |text, elementId|
  within_frame("authorfrm") do 
    find_by_id(elementId).set(text)
  end
end

Then /^I should see the new activity as the first activity in the Authoring Tool$/ do
  within_frame("authorfrm") do 
    #get the id of the first activity
    seqDivId = find('.seq')[:id]
    
    #get the activity number
    seqNum = /master--seq_(\d*)--0/.match(seqDivId)[1]
    
    #get the id of the title input
    titleInputId = 'titleInput_seq_' + seqNum
    
    #compare the activity title
    find('#' + titleInputId).value.should == $tempInputValue
  end
end

Then /^I should see the new step in the first activity in the Authoring Tool$/ do
  within_frame("authorfrm") do 
    #get the first step
    firstStep = find('.node')
    nodeDivId = firstStep[:id]
    
    #get the node id
    nodeId = /.*--(.*)--.*/.match(nodeDivId)[1]
    
    #get the title input
    titleInput = firstStep.all('input')[1]
    titleInput.value.should == $tempInputValue
  end
end

Then /^I should see the activity as the second activity in the Authoring Tool$/ do
  within_frame("authorfrm") do 
    #get the title of the activity previously manipulated
    activityTitle = $tempInputValue
    
    #get all the activities
    seqDivs = page.all('.seq')
    
    #get the seconds activity
    seqDiv = seqDivs[1]
    
    #get the title
    titleInput = seqDiv.all('input')[1]
    
    #compare the title with our saved activity title
    titleInput.value.should == activityTitle
  end
end

Then /^I should see the step as the second step in the Authoring Tool$/ do
  within_frame("authorfrm") do 
    #get the step title that we previously manipulated
    stepTitle = $tempInputValue
    
    #get all the steps
    stepDivs = page.all('.node')
    
    #get the second step
    stepDiv = stepDivs[1]
    
    #get the title
    titleInput = stepDiv.all('input')[1]
    
    #compare the title with our saved step title
    titleInput.value.should == stepTitle
  end
end

Then /^I should see the number of steps increase in the Authoring Tool$/ do
  within_frame("authorfrm") do 
    steps = page.all('.node')
    steps.length.should == ($tempStepCount + 1)
  end
end

Then /^I should see the number of activities increase in the Authoring Tool$/ do
  within_frame("authorfrm") do 
    activities = page.all('.seq')
    activities.length.should == ($tempActivityCount + 1)
  end
end

Then /^I should see the number of steps decrease in the Authoring Tool$/ do
  within_frame("authorfrm") do 
    steps = page.all('.node')
    steps.length.should == ($tempStepCount - 1)
  end
end

Then /^I should see the number of activities decrease in the Authoring Tool$/ do
  within_frame("authorfrm") do 
    activities = page.all('.seq')
    activities.length.should == ($tempActivityCount - 1)
  end
end

Then /^I should see the previously saved content in the "([^"]*)" field in the Authoring Tool$/ do |elementId|
  within_frame("authorfrm") do
    find_by_id(elementId).value.should == $tempInputValue
  end
end

Then /^I should see the previously saved content in the preview frame in the Authoring Tool$/ do
  within_frame("authorfrm") do
    within_frame("previewFrame") do
      should have_content($tempInputValue);
    end
  end
end

Then /^I should see the number of projects with the title "([^"]*)" increase$/ do |projectTitle|
  #get all the project title inputs
  projectTitleInputs = page.all('.projectTitle')
  
  projectCount = 0
  
  #loop through all the title elements
  projectTitleInputs.each { |titleInput|
    #check if the title matches
    if titleInput.text == projectTitle
      #it matches so we will increment our counter
      projectCount += 1
    end
  }
  
  #the count should have been increased by 1
  projectCount.should == ($tempProjectCount + 1)
end