Simple Integration/Acceptance testing for WISE4
========

Uses Ruby and the Ruby gems: capybara, selenium-webdriver, and rspec to create a simple integratiopn/acceptance test structure for WISE4.

Setup
========

1. [Install rvm](http://beginrescueend.com/rvm/install/) and then use rvm to install and use ruby 1.9.2.
    rvm install 1.9.2
    rvm use 1.9.2
2. Install a few globally useful gems for Ruby 1.9.2
    rvm gemset use global
    gem install bundler, rake, ruby-debug19
3. Clone the wise4-test repository:
    git clone git://github.com/concord-consortium/wise4-test.git
    cd wise4-test
4. Create an .rvmrc file to ise ruby 1.9.2 and a wise4-test gemset
    echo 'rvm use 1.9.2@wise4-test --create' > .rvmrc
5. Change out of and back into the directory to enable the .rvmrc file
    cd ..; cd -
6. Install the required Ruby gems into the wise4-test gemset
    bundle install
7. Make sure a local wise4 server is running at http://localhost:8080. See [wise4-vagrant](https://github.com/concord-consortium/wise4-vagrant) for one easy solution.
8. Run all the rspec spec tests:
    rake
