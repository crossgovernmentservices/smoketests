# Since these tests test a multitude of microservices, offer
# the ability to choose which app to test from the feature.
# (possibly do same as https://github.com/alphagov/smokey/blob/master/features/support/base_urls.rb)

Given(/^app (.*?)$/) do |app|
  case app
  when /^[Hh]ome.*/                     then @app = ENV['URL_HOME']
  when /^[Ll]ocations.*/                then @app = ENV['URL_LOCATIONS']
  when /^[Pp]eople.*/                   then @app = ENV['URL_PEOPLE']
  when /^[Pp]rototypes.*/               then @app = ENV['URL_PROTOTYPES']
#  when /^[Xx]xx.*/                      then @app = ENV['URL_XXX']
  else
    raise 'Invalid app ' + app 
  end
end


