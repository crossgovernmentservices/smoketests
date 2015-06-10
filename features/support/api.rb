require 'httparty'
require 'json'
require 'jsonpath'

# any prerequisites to use the APIs below, e.g.
# creating API key, creating account, etc

require 'testutils/http_client'

$httpbasicauth_username = ENV['HTTPBASICAUTH_USERNAME']
$httpbasicauth_password = ENV['HTTPBASICAUTH_PASSWORD']
$accept_header = 'application/json'
