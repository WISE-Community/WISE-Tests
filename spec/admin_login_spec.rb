require File.expand_path('../spec_helper', __FILE__)

describe "Logging in as an admin" do

  def login(username, password)
    visit "/webapp/index.html"
    fill_in 'Username',         :with => username
    fill_in 'Password',         :with => password
    find("#signInButton").click
  end

  it "allows an admin to login" do
    login('admin', 'pass')
    find("h2").text.should eql("Welcome to the WISE Administrator Page")
  end

end
