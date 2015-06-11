When(/^I visit (\/\S*?)$/) do |url|
  page.driver.basic_authorize($httpbasicauth_username, $httpbasicauth_password)
  visit(@app + url)
end

When(/^I click on element with (.+) '(.+)'$/) do |key, val|
  case key
  when 'id'
    val = '#' + val
  when 'class'
    val = '.' + val
  when 'xpath'
    
  else
    raise 'id or name required'
  end
  find(val).click
end

Then(/^I expect the page to have '(.+)'$/) do |content|
  expect(page).to have_content content
end


