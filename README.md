# Simple Integration/Acceptance testing for WISE4

Uses Ruby and the Ruby gems: [Capybara](http://rubydoc.info/github/jnicklas/capybara/master/file/README.rdoc), [RSpec](http://relishapp.com/rspec), [Cucumber](http://cukes.info/) and [selenium-webdriver](https://rubygems.org/gems/selenium-webdriver) to create a simple integration/acceptance test system for WISE4.

The tests expect an instance of WISE4 to be running at http://localhost:8080

## Setup

[Install rvm](http://beginrescueend.com/rvm/install/) and then use rvm to install and use ruby 1.9.2.

    rvm install 1.9.2
    rvm use 1.9.2

Update the installed version of RubyGems that comes with Ruby v1.9.2. On my system this updated RubyGems from v1.6.2 to 1.8.9.

    gem update --system

Install a few globally useful gems for Ruby 1.9.2

    rvm gemset use global
    gem install bundler rake ruby-debug19

Clone the WISE-Test repository:

    git clone git://github.com/WISE-Community/WISE-Tests.git
    cd WISE-Test

Create an `.rvmrc` file to use ruby 1.9.2 and a wise4-test gemset whenever you change to this wise4-test directory:

    echo 'rvm use 1.9.2@WISE-Test --create' > .rvmrc

Change out of and back into the directory to enable the `.rvmrc` file:

    cd ..; cd -

Install the required Ruby gems into the wise4-test gemset:

    bundle install

Install executable stubs into a `./bin` dir so you don't always have to start a command with: `bundle exec`:

    bundle install --binstubs


## Thanks

Thanks to [stephenb](https://github.com/stepheneb) for showing Cucumber to us and getting this testing project started.
