
def login(username, password)
  visit "/webapp/index.html"
  fill_in 'j_username', :with => username
  fill_in 'j_password', :with => password
  find("#signInButton").click
end

def logout
  click_link 'Sign Out'
end

def admin_login
  login('admin', 'pass')
end