
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
    projectId = find_by_id('projectIdDisplay').text
    find_by_id('projectTitleInput').set('Test Project')
    
    ###create activity
    createTestActivity()
    
    ###create steps
    createTestStep('Text/HTML Page')
    createTestStep('Open Response')
  end

  return projectId
end

#must be called from within_frame('authorfrm')
def createTestActivity()
  ###create an activity
  click_button('Add Activity')
  find('#createSequenceDialog').visible?.should == true
    
  #get the current time
  time = Time.now
    
  #create the activity name using Activity + time in milliseconds
  activityName = 'Activity ' + time.to_i.to_s
    
  find_by_id('createSequenceInput').set(activityName)
  click_button('Submit')
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
def createTestStep(stepType)
  click_button('Add Step')
  find('#createNodeDialog').visible?.should == true
    
  #get the current time
  time = Time.now
    
  #create the step name using Step + time in milliseconds
  stepName = 'Step ' + time.to_i.to_s
    
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
    
  #find all the steps
  steps = page.all('.node')
    
  #add the step to the end of the activity
  if steps.length == 0
    firstActivity = find('.seq')
      
    if firstActivity != nil
      firstActivity.click
    end
  else
    steps[steps.length - 1].click
  end
    
  #get the last step
  steps = page.all('.node')
  lastStep = steps[steps.length - 1]
  nodeDivId = lastStep[:id]
    
  #get the node id
  nodeId = /.*--(.*)--.*/.match(nodeDivId)[1]
    
  #get the title input
  titleInput = lastStep.all('input')[1]
    
  #make sure the step was successfully added
  titleInput.value.should == stepName
end

#teacher should already be logged in
def createTestRun(projectId)
  #login(teacherLogin, teacherPassword)
  visit '/webapp/teacher/index.html'
  page.should have_content("Teacher Home")
  find('a', :text => 'Management').click
  find('a', :text => 'Browse WISE Projects').click

  #find the project
  within('#keyword_input_0') do
    find('input').set(projectId)
    find('input').native.send_keys(:return)
  end
  
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
  
  #get the run code
  runCode = find('#projectRunConfirmTable').find('div').text
  
  return runCode
end

#Given

@javascript
Given /^I run the setup$/ do
  mySetup = File.new('features/setup_variables.rb', 'w')
  
  #login and password for the admin account
  mySetup.puts '$adminLogin = "admin"'
  mySetup.puts '$adminPassword = "pass"'
  puts 'Created Admin'
  
  #create teacher account 1
  teacherLogin1, teacherPassword1 = createTestTeacherAccount()
  mySetup.puts '$teacherLogin1 = "' + teacherLogin1 + '"'
  mySetup.puts '$teacherPassword1 = "' + teacherPassword1 + '"'
  puts 'Created Teacher 1'
  
  #create teacher account 2
  teacherLogin2, teacherPassword2 = createTestTeacherAccount()
  mySetup.puts '$teacherLogin2 = "' + teacherLogin2 + '"'
  mySetup.puts '$teacherPassword2 = "' + teacherPassword2 + '"'
  puts 'Created Teacher 2'
  
  #create project 1 with teacher account 1
  projectId = createTestProject(teacherLogin1, teacherPassword1)
  mySetup.puts '$projectId = "' + projectId + '"'
  puts 'Created Project'
  
  #create run 1 with project 1 with teacher account 1
  runCode = createTestRun(projectId)
  mySetup.puts '$runCode = "' + runCode + '"'
  puts 'Created Run'
  
  #create student account 1 with run 1 period 1
  studentLogin1, studentPassword1 = createTestStudentAccount(runCode, '1')
  mySetup.puts '$studentLogin1 = "' + studentLogin1 + '"'
  mySetup.puts '$studentPassword1 = "' + studentPassword1 + '"'
  puts 'Created Student 1'
  
  #create student account 2 with run 1 period 1
  studentLogin2, studentPassword2 = createTestStudentAccount(runCode, '1')
  mySetup.puts '$studentLogin2 = "' + studentLogin2 + '"'
  mySetup.puts '$studentPassword2 = "' + studentPassword2 + '"'
  puts 'Created Student 2'
  
  #create student account 3 with run 1 period 2
  studentLogin3, studentPassword3 = createTestStudentAccount(runCode, '2')
  mySetup.puts '$studentLogin3 = "' + studentLogin3 + '"'
  mySetup.puts '$studentPassword3 = "' + studentPassword3 + '"'
  puts 'Created Student 3'
end