require 'httparty'
require 'json'
require 'jsonpath'

# any prerequisites to use the APIs below, e.g.
# creating API key, creating account, etc

require 'testutils/http_client'

$httpbasicauth_username = ENV['BASIC_AUTH_USERNAME']
$httpbasicauth_password = ENV['BASIC_AUTH_PASSWORD']
$accept_header = 'application/json'
