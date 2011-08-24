require File.expand_path('../spec_helper', __FILE__)

describe "A logged in admin user can" do

  before(:each) do
    admin_login
  end

  it "logout" do
    logout
    page.has_link?("#signInButton")
  end
  
  it "view the Admin Home Page" do
    find("h2").text.should eql("Welcome to the WISE Administrator Page")
  end

  it "view a Teacher Home Page" do
    click_link 'Teacher Home Page'
    find("#teacherInterfaceHeader").text.should eql("teacher dashboard")
  end

  describe "perform User Management from The Admin Home Page and" do
    
    it "list All Teachers" do
      click_link 'All Teachers'
      page.should have_content("Total number of teachers:")
    end

    it "list All Students" do
      click_link 'All Students'
      page.should have_content("Total number of students:")
    end
    
    it "list All Currently-Logged In Users" do
      click_link 'All Currently-Logged In Users'
      page.should have_content("Currently logged in teachers")
      page.should have_content("Currently logged in students")
    end

    it "list All Users Who Logged in Today" do
      click_link 'All Users Who Logged in Today'
      page.should have_content("Teachers who logged in today")
      page.should have_content("Students who logged in today")
    end

    it "find a Teacher" do
      page.find('a[href="lookupteacher.html"]').click
      page.should have_content("Search for all teachers by")
    end

    it "find a Student" do
      page.find('a[href="lookupstudent.html"]').click
      page.should have_content("Search for all students by")
    end

  end

  describe "perform Project Run Management from the Admin Home Page and" do
    
    it "list Runs Today" do
      click_link 'today'
      page.should have_content("Runs run today")
    end

    it "list Runs This Week" do
      click_link 'this week'
      page.should have_content("Runs run this week")
    end

    it "list Runs This Month" do
      click_link 'this month'
      page.should have_content("Runs run this month")
    end

    it "list Runs By Activity" do
      click_link 'runs by activity'
      page.should have_content("Runs by activity")
    end

    it "manage Current Project Runs" do
      click_link 'Current'
      page.should have_content("Number of runs")
    end
    
    it "manage Archived Project Runs" do
      click_link 'Archived'
      page.should have_content("Number of runs")
    end

    it "find Project Runs By Teacher" do
      page.find('a[href="findprojectrunsbyteacher.html"]').click
      page.should have_content("Enter the username of the Teacher")
    end
    
    it "find Project Runs By Project Id" do
      click_link 'Project Id'
      page.should have_content("Enter the Id of the project you wish to manage")
    end

    it "find Project Runs By Run Id" do
      click_link 'Run Id'
      page.should have_content("Enter the run Id")
    end

  end

end
