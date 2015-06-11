When(/^I visit (\/\S*?)$/) do |url|
  page.driver.basic_authorize($httpbasicauth_username, $httpbasicauth_password)
  visit(@app + url)
end

Then(/^I expect the page to have '(.+)'$/) do |content|
  expect(page).to have_content content
end


