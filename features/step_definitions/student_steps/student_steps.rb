
#Then

Then /^I should see "([^"]*)" in the VLE$/ do |text|
  within_frame("topifrm") do 
    page.should have_content(text)
  end
end

Then /^I should see the div with id "([^"]*)" in the VLE$/ do |divId|
  within_frame("topifrm") do 
    page.should have_selector('#' << divId)
  end
end