require 'erb'

When(/^I (\w+) to (\/\S*?)$/) do |verb, url|
  $logger.debug("Making request to #{url}")
  $logger.debug("hydrated: #{@client.hydrater(url)}")
  @client.send(verb.downcase, @app, @client.hydrater(url), env)
end

When(/^I (\w+) to (\/\S*?) with the body:$/) do |verb, url, body|
  $logger.debug("Making request to #{url}")
  $logger.debug("hydrated: #{@client.hydrater(url)}")
  body = @client.hydrater body
  $logger.debug("body: #{body}")
  @client.send(verb.downcase, @app, @client.hydrater(url), body, env)
end

When(/^I (\w+) to (\/\S*?) with the fixture: "(.*?)", substituting (.*?) with (.*?)$/) do |verb, url, fixture, json_path, substitution|
  body = @client.fixture(fixture)
  substituted_body = JsonPath.for(body).gsub(json_path) { |v| substitution }.to_hash
  step "I #{verb} to #{url} with the body:", substituted_body.to_json
end

When(/^I (\w+) to (\/\S*?) with the fixture: "(.*?)"$/) do |verb, url, fixture|
  body = @client.fixture(fixture)
  step "I #{verb} to #{url} with the body:", body
end

When(/^I make a (\w+) request to (\/\S*?)$/) do |verb, url|
  step "I #{verb} to #{url}"
end

When(/^I make a (\w+) request to (\/\S*?) with the body:$/) do |verb, url, body|
  step "I #{verb} to #{url} with the body:", body
end

def env
  {
    # "foo_id" => @foo_id,
  }
end


When(/^I make a (\w+) request to the href "(.*?)"$/) do |verb, keys|
  link = @client[keys] || @client.inject(keys)
  @client.send(verb.downcase, @app, link, {}, env)
end

When(/^I make a (\w+) request to the href "(.*?)" with the body:$/) do |verb, keys, body|
  body = @client.hydrater(body)
  link = @client[keys] || @client.inject(keys)
  @client.send(verb.downcase, @app, link, body, env)
end

When(/^I make a (\w+) request to the link "(.*?)" of that (\w+)$/) do |verb, keys, resource|
  id = instance_variable_get("@#{resource}_id")
  @client.get("/resources/#{id}")
  step %Q{I make a #{verb} request to the link "#{keys}"}
end

When(/^I fetch the (.*+)$/) do |resource|
  resource = resource.gsub(/\s/, "_")
  id = instance_variable_get("@#{resource}_id")
  @client.get("/resources/#{id}")
end

When(/^I GET "(.*?)" from the previous response$/) do |keys|
  @client.get(@client.inject keys)
end

When /^I wait (\d+) seconds?$/ do |seconds|
  sleep seconds.to_i
end

require 'json-schema'
Then(/^the response has this schema:$/) do |schema|
  @client.validate(schema)
end

Then(/^the response is valid according to the "(.*?)" schema$/) do |filename|
  @client.validate(filename)
end

Then(/^I should get a (.+) status code$/) do |code|
  message = @client.last_body["status"] rescue ""
  expect(code.to_i).to eq(@client.last_code)
end

Then(/^there should be no response body$/) do
  assert_nil @client.last_body
end

def checker(from, of, nesting)
  assert_not_nil from, nesting

  from.each_pair do |key, val|
    if val.is_a?(String) || val.is_a?(Integer) || val.is_a?(TrueClass) || val.is_a?(FalseClass)
      assert_equal val, of[key], "#{nesting}>#{key}"
    elsif val.nil?
      assert_nil of[key]
    else
      checker val, of[key], "#{nesting}>#{key}"
    end
  end
end

Then(/^the fields on this (.*) match:$/) do |resource, against|
  checker JSON.parse(@client.hydrater(against)), @client["#{resource}s"], ''
  assert_equal @client.last_body["#{resource}s"].size, 1
end

Then(/^the fields on these (.*) match:$/) do |resource, against|
  against = JSON.parse(@client.hydrater(against))
  @client.last_body[resource].each do |body|
    checker against, body, ''
  end
end

Then(/^there should be more than two (.*) paged$/) do |name|
  assert @client.last_body[name].size >= 2, "There were not more than two #{name}"
end

Before do |scenario|
  @client = TestUtils::HttpClient.new($httpbasicauth_username, $httpbasicauth_password, $accept_header)
  @client.running = scenario
end

When(/^I (\w+) to (\/\S*?) without the (\w+) key$/) do |verb, url, key|
  body = @client.fixture('new_registration')
  hash = JSON.parse(body)
  hash['title_number'] = 'TEST' + DateTime.now.strftime('%Q')
  hash.delete(key)
  step "I #{verb} to #{url} with the body:", hash.to_json
end

Then(/^I get an error for (\w+)$/) do |key|
  assert_equal true, @client.last_body['error'].has_key?(key)
end
