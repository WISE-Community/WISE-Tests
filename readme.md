Simple Integration/Acceptance testing for WISE4
========

Uses Ruby and the Ruby gems: capybara, selenium-webdriver, and rspec to create a simple integration/acceptance test structure for WISE4.

Setup
========

[Install rvm](http://beginrescueend.com/rvm/install/) and then use rvm to install and use ruby 1.9.2.

    rvm install 1.9.2
    rvm use 1.9.2

Install a few globally useful gems for Ruby 1.9.2

    rvm gemset use global
    gem install bundler, rake, ruby-debug19

Clone the wise4-test repository:

    git clone git://github.com/concord-consortium/wise4-test.git
    cd wise4-test

Create an .rvmrc file to ise ruby 1.9.2 and a wise4-test gemset

    echo 'rvm use 1.9.2@wise4-test --create' > .rvmrc

Change out of and back into the directory to enable the .rvmrc file

    cd ..; cd -

Install the required Ruby gems into the wise4-test gemset

    bundle install

Make sure a local wise4 server is running at http://localhost:8080. See [wise4-vagrant](https://github.com/concord-consortium/wise4-vagrant) for one easy solution.

Run all the rspec spec tests:

    rake

Currently tests are written in rspec. 

Here's an example:

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

Running the tests in the console with rake produces the following results:

    $ rake
    /Users/stephen/.rvm/rubies/ruby-1.9.2-p290/bin/ruby -S bundle exec rspec -fp --color spec/admin_login_spec.rb
    .

    Finished in 6.91 seconds
    1 example, 0 failures
