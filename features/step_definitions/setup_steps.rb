$sleepDuration = 2

def createTestTeacherAccount()
  visit '/webapp/teacher/registerteacher.html'
  fill_in 'teacherFirstName', :with => 'Test'
  fill_in 'teacherLastName', :with => 'Teacher'
  fill_in 'teacherEmail', :with => 'testteacher@berkeley.edu'
  fill_in 'teacherCity', :with => 'Test City'
  fill_in 'teacherState', :with => 'Test State'
  fill_in 'teacherCountry', :with => 'Test Country'
  fill_in 'teacherSchool', :with => 'Test School'
  find_by_id('schoollevel').select('Elementary School')
  find_by_id('legalAcknowledged').click
  fill_in 'password', :with => 'a'
  fill_in 'repeatedPassword', :with => 'a'
  fill_in 'howDidYouHearAboutUs', :with => 'Test'
  find('a', :text => 'Create Account').click
  
  if(page.has_content?('Account Already Exists'))
    find('a', :text => 'Create New Account').click
  end
  
  page.should have_content('Account Created!')
  return page.find('.usernameDisplay').text, 'a'
end

def createTestStudentAccount(runCode, period)
  visit '/webapp/student/registerstudent.html'
  fill_in 'firstname', :with => 'TestStuden'
  fill_in 'lastname', :with => 't'
  find_by_id('gender').select('Male')
  find_by_id('birthmonth').select('1')
  find_by_id('birthdate').select('1')
  fill_in 'password', :with => 'a'
  fill_in 'repeatedPassword', :with => 'a'
  find_by_id('accountQuestion').select('What is your middle name')
  fill_in 'accountAnswer', :with => 'a'
  fill_in 'runCode_part1', :with => runCode
  find('a', :text => 'Show Class Periods').click
  find_by_id('runCode_part2').select(period)
  find('a', :text => 'Create Account').click
  
  if(page.has_content?('Account Already Exists'))
    find('a', :text => 'Create New Account').click
  end
  
  page.should have_content('Account Created!')
  return page.find('.usernameDisplay').text, 'a'
end

def createTestProject(teacherLogin, teacherPassword)
  login(teacherLogin, teacherPassword)
  page.should have_content("Teacher Home")
  find('a', :text => 'Management').click
  find('a', :text => 'Launch Authoring Tool').click
  projectId = nil
  
  within_frame('authorfrm') do
    ###create a project
    click_button('Create Project')
    find('#createProjectDialog').visible?.should == true
    find_by_id('projectInput').set('Test Project')
    click_button('Submit')
    should have_content('Project Title');
    
    until find_by_id('projectTitleInput').visible?
      #puts 1
      sleep 1
    end
    
    find_by_id('projectTitleInput').set('Test Project')
    
    ###create activity
    createTestActivity()
    
    ###create steps
    createTestStep('Text/HTML Page', '<html><head><title></title></head><body>This is an HTML step.</body></html>')
    createTestStep('Open Response', 'This is the first Open Response step.')
    createTestStep('Open Response', 'This is the second Open Response step.')
    createTestStep('Open Response', 'This is the third Open Response step.')
    
    sleep $sleepDuration
    
    ##enable idea basket and student file uploader
    click_button('Edit Info')
    check('enableIdeaManager')
    check('enableStudentAssetUploader')
    find('span', :text => 'Save Changes').click
    
    #get the project id
    projectId = find_by_id('projectIdDisplay').text
    
    click_button('Exit to Home')
    click_link('Sign Out')
  end

  return projectId
end

#must be called from within_frame('authorfrm')
def createTestActivity()
  click_button('Add Activity')
  find('#createSequenceDialog').visible?.should == true
    
  #get the current time
  time = Time.now
    
  #create the activity name using Activity + time in milliseconds
  activityName = 'Activity ' + time.to_i.to_s
  
  #set the activity name
  find_by_id('createSequenceInput').set(activityName)
  click_button('Submit')
  
  sleep $sleepDuration
  
  #add the activity to the beginning of the project
  find('.master').click
  
  #get the id of the first activity
  seqDivId = find('.seq')[:id]
    
  #get the activity number
  seqNum = /master--seq_(\d*)--0/.match(seqDivId)[1]
    
  #get the id of the title input
  titleInputId = 'titleInput_seq_' + seqNum
    
  #compare the activity title
  find('#' + titleInputId).value.should == activityName
end

#must be called from within_frame('authorfrm')
#this will add steps to the first activity
def createTestStep(stepType, prompt)
  click_button('Add Step')
  find('#createNodeDialog').visible?.should == true
    
  #get the current time
  time = Time.now
    
  #create the step name using Step + time in milliseconds
  stepName = 'Step ' + time.to_i.to_s
    
  #set the step name
  find_by_id('createNodeTitle').set(stepName)
    
  #get all the option elements
  options = page.all('option')
    
  optionToSelect = nil

  #loop through all the option elements
  options.each { |option|
    #find the option elements for the select box
    if option[:name] == 'selectStepTypeOption'
      #check if we have found the option with the value we want
      if option.value == stepType || option.text == stepType
        #we have found the value so we will break out of the loop
        optionToSelect = option
        break
      end
    end
  }
    
  #select the step type
  page.select optionToSelect.text, :from => 'createNodeType'
    
  #create the step
  click_button('Submit')
  
  #we should see the prompt to select the location for the new step
  page.should have_content('Select a new location')
  
  #find all the steps
  steps = page.all('.node')
  
  #get the total number of steps
  totalNumSteps = steps.length
  
  #this new step is the last step and is currently in the inactive steps area
  #we need to place it at the end of the first activity which we will do below
  stepNumber = totalNumSteps - 1
  
  ##now we will insert the step at the end of the first activity
  
  #add the step to the end of the first activity
  if steps.length == 0 || steps.length == 1
    #there are no steps so we will just add it to the activity
    
    #find the first activity
    firstActivity = find('.seq')
      
    if firstActivity != nil
      #click on the first activity to place the step there
      firstActivity.click
    end
  else
    #there are other steps so we will add it after the last step in the first activity
    
    #click on the second to last step so that this step will be placed after it
    steps[steps.length - 2].click
  end
  
  ##now we will edit the prompt for the step
  
  #get the last step
  steps = page.all('.node')
  lastStep = steps[stepNumber]
    
  #get the title input for the step
  titleInput = lastStep.all('input')[1]
    
  #make sure the step was successfully added by comparing the step name
  titleInput.value.should == stepName
  
  #get all the edit buttons
  editButtons = page.all('.editNodeInput')
  
  #click the edit button for our new step
  editButton = editButtons[stepNumber]
  editButton.click

  #set the prompt
  fill_in 'promptInput', :with => prompt
  click_button('Save & Close')
end

#teacher should already be logged in
def createTestRun(teacherLogin, teacherPassword, projectId)
  login(teacherLogin, teacherPassword)
  page.should have_content("Teacher Home")
  find('a', :text => 'Management').click
  find('a', :text => 'Browse WISE Projects').click

  #find the project
  within('#keyword_input_0') do
    find('input').set(projectId)
    find('input').native.send_keys(:return)
  end
  
  #after the search filter has completed it will display "Showing X Projects"
  page.should have_content('Showing')
  
  #create the run
  page.should have_content('Test Project')
  find('a', :text => 'Start New Run').click
  
  page.should have_content('Step 1 of 5')
  click_button('Next')
  page.should have_content('Step 2 of 5')
  click_button('Next')
  page.should have_content('Step 3 of 5')
  find('#PERIOD_1').click
  find('#PERIOD_2').click
  click_button('Next')
  page.should have_content('Step 4 of 5')
  click_button('Next')
  page.should have_content('Step 5 of 5')
  click_button('Done')

  #get the project id
  projectIdTdText = find('#projectRunConfirmTable').all('td')[3].text
  projectId = /(\d*).*/.match(projectIdTdText)[1]

  #get the run id
  runIdTdText = find('#projectRunConfirmTable').all('td')[5].text
  runId = /(\d*).*/.match(runIdTdText)[1]
  
  #get the run code
  runCode = find('#projectRunConfirmTable').find('div').text
  
  click_link('Sign Out')
  
  return projectId, runId, runCode
end

#Given

Given /^I create the setup_variables.rb file$/ do
  $mySetup = File.new('features/setup_variables.rb', 'w')
end

And /^I create the admin account$/ do
  #login and password for the admin account
  $mySetup.puts '$adminLogin = "admin"'
  $mySetup.puts '$adminPassword = "pass"'
end

And /^I create the teacher 1 account$/ do
  #create teacher account 1
  $teacherLogin1, $teacherPassword1 = createTestTeacherAccount()
  $mySetup.puts '$teacherLogin1 = "' + $teacherLogin1 + '"'
  $mySetup.puts '$teacherPassword1 = "' + $teacherPassword1 + '"'
end

And /^I create the teacher 2 account$/ do
  #create teacher account 2
  $teacherLogin2, $teacherPassword2 = createTestTeacherAccount()
  $mySetup.puts '$teacherLogin2 = "' + $teacherLogin2 + '"'
  $mySetup.puts '$teacherPassword2 = "' + $teacherPassword2 + '"'
end

And /^I create the project 1$/ do
  #create project 1 with teacher account 1
  $parentProjectId1 = createTestProject($teacherLogin1, $teacherPassword1)
  $mySetup.puts '$parentProjectId1 = "' + $parentProjectId1 + '"'
end

And /^I create the run 1$/ do
  #create run 1 with project 1 with teacher account 1
  $projectId1, $runId1, $runCode1 = createTestRun($teacherLogin1, $teacherPassword1, $parentProjectId1)
  $mySetup.puts '$projectId1 = "' + $projectId1 + '"'
  $mySetup.puts '$runId1 = "' + $runId1 + '"'
  $mySetup.puts '$runCode1 = "' + $runCode1 + '"'
end

And /^I create the project 2$/ do
  #create project 2 with teacher account 2
  $parentProjectId2 = createTestProject($teacherLogin2, $teacherPassword2)
  $mySetup.puts '$parentProjectId2 = "' + $parentProjectId2 + '"'
end

And /^I create the run 2$/ do
  #create run 2 with project 2 with teacher account 2
  $projectId2, $runId2, $runCode2 = createTestRun($teacherLogin2, $teacherPassword2, $parentProjectId2)
  $mySetup.puts '$projectId2 = "' + $projectId2 + '"'
  $mySetup.puts '$runId2 = "' + $runId2 + '"'
  $mySetup.puts '$runCode2 = "' + $runCode2 + '"'
end

And /^I create the student 1 account$/ do
  #create student account 1 with run 1 period 1
  $studentLogin1, $studentPassword1 = createTestStudentAccount($runCode1, '1')
  $mySetup.puts '$studentLogin1 = "' + $studentLogin1 + '"'
  $mySetup.puts '$studentPassword1 = "' + $studentPassword1 + '"'
end

And /^I create the student 2 account$/ do
  #create student account 2 with run 1 period 1
  $studentLogin2, $studentPassword2 = createTestStudentAccount($runCode1, '1')
  $mySetup.puts '$studentLogin2 = "' + $studentLogin2 + '"'
  $mySetup.puts '$studentPassword2 = "' + $studentPassword2 + '"'
end

And /^I create the student 3 account$/ do
  #create student account 3 with run 1 period 2
  $studentLogin3, $studentPassword3 = createTestStudentAccount($runCode1, '2')
  $mySetup.puts '$studentLogin3 = "' + $studentLogin3 + '"'
  $mySetup.puts '$studentPassword3 = "' + $studentPassword3 + '"'
end

Then /^I am done with the setup$/ do

end