When(/^I visit (\/\S*?)$/) do |url|
  page.driver.basic_authorize($httpbasicauth_username, $httpbasicauth_password)
  visit(@app + url)
end

When(/^I click on element with (.+) '(.+)'$/) do |key, val|
  case key
  when 'id'
    elem = find(:css, '#' + val)
  when 'class'
    elem = first(:css, '.' + val)
  when 'xpath'
    elem = find(:xpath, val)
  else
    raise 'id or name required'
  end
  elem.click
end

When(/^I create a profile with '(.+)'$/) do |email|
  fill_in('Email', :with => email)
  click_on('Create profile')
end

Then(/^I expect the page to have '(.+)'$/) do |content|
  expect(page).to have_content content
end


