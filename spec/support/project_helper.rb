# this assumes you are logged in as a user that can create projects
# it should at least return an id, perhaps it should also return an object
# that you can use to manipulate this particular project
def create_project(project_name)
  visit("/webapp/author/authorproject.html")
  project_id = -1
  within_frame("authorfrm") do
    click_on("Create a New Project")

    within('.ui-dialog') do
      page.should have_selector("#projectInput")
      fill_in("projectInput", :with => project_name)
      click_on("Submit")
    end
    
    find('#projectTitleInput').value.should eq(project_name)
    project_id = find('#projectIdDisplay').text.to_i
  end
  return project_id
end

# this assumes you are on the project page where you want to create the activity
def create_activity(activity_name)
  within_frame("authorfrm") do
    click_on("Add Activity")
    
    within('.ui-dialog') do
      page.should have_selector("#createSequenceInput")
      fill_in("createSequenceInput", :with => activity_name)
      click_on("Submit")
    end
    
    page.should have_content("Select a new location for the selected activity")
    
    find('.projectNode.master').click
  end
end

def create_step(step_name, step_type)
  within_frame("authorfrm") do
    click_on("Add Step")
    
    within('.ui-dialog') do
      fill_in('createNodeTitle', :with => step_name)
      select(step_type, :from => 'createNodeType')
      click_on("Submit")
    end
  
    page.should have_content("Select a new location for the selected step")
    
    # add it to the first sequence found
    find('.projectNode.seq').click
  end
end

# this assumes you are on the project page you want to preview
def preview_project(&blk)
  within_frame("authorfrm") do
    click_on("Preview Project")
  end
  
  page.driver.browser.window_handles.length.should == 2
  
  within_window(page.driver.browser.window_handles.last) do
    current_path.should be_start_with('/webapp/vle/preview.html')
    yield blk
  end
end  