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
    cd WISE-Tests

Create an `.rvmrc` file to use ruby 1.9.2 and a wise4-test gemset whenever you change to this wise4-test directory:

    echo 'rvm use 1.9.2@WISE-Test --create' > .rvmrc

Change out of and back into the directory to enable the `.rvmrc` file:

    cd ..; cd -

Install the required Ruby gems into the wise4-test gemset:

    bundle install

Install executable stubs into a `./bin` dir so you don't always have to start a command with: `bundle exec`:

    bundle install --binstubs


## Running the Cucumber feature tests

The Cucumber features tests are in the `features/` directory.

Run all the [Cucumber](https://github.com/cucumber/cucumber/wiki/) feature tests:

    cd WISE-Tests
    rake features

Run all the feature tests in a specific folder

    cd WISE-Tests
    cucumber features/teacher_features/authoring_tool_features

Run a specific feature test

    cd WISE-Tests
    cucumber features/teacher_features/authoring_tool_features/launch_authoring_tool.feature


## Developing Tests

Capybara has an extensive DSL for interrogating web pages: [Capybara DSL](http://rubydoc.info/github/jnicklas/capybara/master/file/README.rdoc#The_DSL)

### [Capybara::Node::Actions](http://rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Actions)

Capybara uses css selectors by default bit also has a full set of xpath selectors. [Capybara: XPath, CSS and selectors](http://rubydoc.info/github/jnicklas/capybara/master/file/README.rdoc#XPath__CSS_and_selectors)

Capybara Actions all return objects

- `attach_file(locator, path)`
Find a file field on the page and attach a file given its path.
- `check(locator)`
Find a check box and mark it as checked.
- `choose(locator)`
Find a radio button and mark it as checked.
- `click_button(locator)`
Finds a button by id, text or value and clicks it.
- `click_link(locator)`
Finds a link by id or text and clicks it.
- `click_link_or_button(locator) (also: #click_on)`
Finds a button or link by id, text or value and clicks it.
- `fill_in(locator, options = {})`
Locate a text field or text area and fill it in with the given text The field can be found via its name, id or label text.
- `select(value, options = {})`
Find a select box on the page and select a particular option from it.
- `uncheck(locator)`
Find a check box and mark uncheck it.
- `unselect(value, options = {})`
Find a select box on the page and unselect a particular option from it.

### [Capybara::Node::Matchers](http://rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Matchers)

Capybara Matchers all return booleans:

- `has_button?(locator)`
Checks if the page or current node has a button with the given text, value or id.
- `has_checked_field?(locator)`
Checks if the page or current node has a radio button or checkbox with the given label, value or id, that is currently checked.
- `has_content?(content)`
Checks if the page or current node has the given text content, ignoring any HTML tags and normalizing whitespace.
- `has_css?(path, options = {})`
Checks if a given CSS selector is on the page or current node.
- `has_field?(locator, options = {})`
Checks if the page or current node has a form field with the given label, name or id.
- `has_link?(locator, options = {})`
Checks if the page or current node has a link with the given text or id.
- `has_no_button?(locator)`
Checks if the page or current node has no button with the given text, value or id.
- `has_no_checked_field?(locator)`
Checks if the page or current node has no radio button or checkbox with the given label, value or id, that is currently checked.
- `has_no_content?(content)`
Checks if the page or current node does not have the given text content, ignoring any HTML tags and normalizing whitespace.
- `has_no_css?(path, options = {})`
Checks if a given CSS selector is not on the page or current node.
- `has_no_field?(locator, options = {})`
Checks if the page or current node has no form field with the given label, name or id.
- `has_no_link?(locator, options = {})`
Checks if the page or current node has no link with the given text or id.
- `has_no_select?(locator, options = {})`
Checks if the page or current node has no select field with the given label, name or id.
- `has_no_selector?(*args)`
Checks if a given selector is not on the page or current node.
- `has_no_table?(locator, options = {})`
Checks if the page or current node has no table with the given id or caption.
- `has_no_unchecked_field?(locator)`
Checks if the page or current node has no radio button or checkbox with the given label, value or id, that is currently unchecked.
- `has_no_xpath?(path, options = {})`
Checks if a given XPath expression is not on the page or current node.
- `has_select?(locator, options = {})`
Checks if the page or current node has a select field with the given label, name or id.
- `has_selector?(*args)`
Checks if a given selector is on the page or current node.
- `has_table?(locator, options = {})`
Checks if the page or current node has a table with the given id or caption.
- `has_unchecked_field?(locator)`
Checks if the page or current node has a radio button or checkbox with the given label, value or id, that is currently unchecked.
- `has_xpath?(path, options = {})`
Checks if a given XPath expression is on the page or current node.

### [Capybara::Node::Finders](http://rubydoc.info/github/jnicklas/capybara/master/Capybara/Node/Finders)

The following Capybara Finders all return Capybara::Element objects:

- `all(*args)`
Find all elements on the page matching the given selector and options.
- `find(*args)`
Find an Element based on the given arguments.
- `find_button(locator)`
Find a button on the page.
- `find_by_id(id)`
Find a element on the page, given its id.
- `find_field(locator) (also: #field_labeled)`
Find a form field on the page.
- `find_link(locator)`
Find a link on the page.

The `first` Capybara finder returns an object:

- `first(*args)`
Find the first element on the page matching the given selector and options, or nil if no element matches.


## Debugging Tests

If you want to debug a test with the console-based Ruby debugger, insert the following line in your .rb file at the point you want to pause:

    debugger

And start the cucumber test:

    cucumber features/teacher_features/authoring_tool_features/launch_authoring_tool.feature

Your test will execute until the debugger statement at which point the Ruby debugger will be open in the console and FireFox will be on the screen.

When you are finished debugging complete the test by entering: `cont`


## Documentation/References

* [Capybara](https://github.com/jnicklas/capybara)
* [Cucumber](http://cukes.info/)
* [Cucumber Tutorial](http://cuke4ninja.com/)


## Thanks

Thanks to [stephenb](https://github.com/stepheneb) for showing Cucumber to us and getting this testing project started.
