require 'cucumber'
require 'cucumber/rake/task'


namespace :features do

  Cucumber::Rake::Task.new(:aws) do |t|
    t.profile = "aws"
  end

  Cucumber::Rake::Task.new(:devenv) do |t|
    t.profile = "devenv"
  end

  Cucumber::Rake::Task.new(:heroku) do |t|
    t.profile = "heroku"
  end

end

task :default => 'features:devenv'
