# Simple Integration/Acceptance testing for WISE4

Uses Ruby and the Ruby gems: [Capybara](http://rubydoc.info/github/jnicklas/capybara/master/file/README.rdoc), [RSpec](http://relishapp.com/rspec), [Cucumber](http://cukes.info/) and [selenium-webdriver](https://rubygems.org/gems/selenium-webdriver) to create a simple integration/acceptance test system for WISE4.

The tests expect an instance of WISE4 to be running at http://localhost:8080

## Setup

[Install rvm](http://beginrescueend.com/rvm/install/) and then use rvm to install and use ruby 1.9.2.

    rvm install 1.9.2
    rvm use 1.9.2

Install a few globally useful gems for Ruby 1.9.2

    rvm gemset use global
    gem install bundler, rake, ruby-debug19

Clone the wise4-test repository:

    git clone git://github.com/concord-consortium/wise4-test.git
    cd wise4-test

Create an `.rvmrc` file to use ruby 1.9.2 and a wise4-test gemset whenever you change to this wise4-test directory:

    echo 'rvm use 1.9.2@wise4-test --create' > .rvmrc

Change out of and back into the directory to enable the `.rvmrc` file:

    cd ..; cd -

Install the required Ruby gems into the wise4-test gemset:

    bundle install

Install executable stubs into a `./bin` dir so you don't always have to start a command with: `bundle exec`:

    bundle install --binstubs

## Running the RSpec spec tests

Make sure a local wise4 server is running at http://localhost:8080. See [wise4-vagrant](https://github.com/concord-consortium/wise4-vagrant) for one easy solution.

Run all the [RSpec](http://relishapp.com/rspec) spec tests:

    rake spec

The RSpec spec tests are in the `spec/` directory.

Here's an example that uses the [Capaybara DSL](http://rubydoc.info/github/jnicklas/capybara/master/file/README.rdoc#The_DSL}) for interacting with WISE4 via [selenium-webdriver](https://rubygems.org/gems/selenium-webdriver):

    describe "An admin user can" do
      def login(username, password)
        visit "/webapp/index.html"
        fill_in 'Username',         :with => username
        fill_in 'Password',         :with => password
        find("#signInButton").click
      end

      it "login" do
        login('admin', 'pass')
        find("h2").text.should eql("Welcome to the WISE Administrator Page")
      end
    end

Running just this tests in the console with rake produces the following results on my system:

    $ rake
    /Users/stephen/.rvm/rubies/ruby-1.9.2-p290/bin/ruby -S bundle exec rspec -fp --color spec/admin_login_spec.rb
    .

    Finished in 6.91 seconds
    1 example, 0 failures

You can run a single file of spec tests like this:

    rspec spec/admin_spec.rb

## Running the Cucumber feature tests

Run all the [Cucumber](https://github.com/cucumber/cucumber/wiki/) feature tests:

    rake features

The Cucumber features tests are in the `features/` directory.

## Debugging Tests

### Ruby Debug

If you want to debug a test with the console-based Ruby debugger insert the following line in your spec test:

    debugger

And start the spec test with debugging turned on with the -d option:

    rspec spec/admin_spec.rb -d

Your test will execute until the debugger statement at which point the Ruby debugger will be open in the console and FireFox will be on the screen.

When you are finished debugging complete the test by entering: `cont`

### Save and open html page

Insert this line into a test to save and open a copy of the html page:

    save_and_open_page

## Documentation/References

* [Capybara](https://github.com/jnicklas/capybara)
* [Capybara documentation](http://rubydoc.info/github/jnicklas/capybara/master/file/README.rdoc)
* [Capybara Standalone](https://github.com/atmos/capybara-standalone)
* [RSpec 2.0 documentation](http://relishapp.com/rspec)
* [Cucumber](https://github.com/cucumber/cucumber)
* [Cucumber documentation](https://github.com/cucumber/cucumber/wiki/)
* [Cucumber site](http://cukes.info/)
* [Cucumber Standalone](http://github.com/thuss/standalone-cucumber)
* [selenium-webdriver](https://rubygems.org/gems/selenium-webdriver)
* [launchy](http://www.copiousfreetime.org/projects/launchy/)