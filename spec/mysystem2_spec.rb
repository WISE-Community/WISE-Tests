require File.expand_path('../spec_helper', __FILE__)

describe("A MySystem2 step can") do
  it("be added to a project") do
    admin_login
    # make sure we are logged in
    find("h2").text.should eql("Welcome to the WISE Administrator Page")
    
    project_id = create_project("Auto Test Project")
    
    # make sure it is valid id
    project_id.should be_a_kind_of(Fixnum)

    create_activity("First Activity")
    
    create_step("MySystem", "My System 2")
    
    # now it is added, lets preview the project to see if it is really there
    preview_project() do
      within_frame("topifrm") do
        within_frame("ifrm") do
          # check that the mysystem and sproutcore classes are present
          page.should have_selector('.sc-main.mysystem-theme')
        end
      end
    end
  end
end