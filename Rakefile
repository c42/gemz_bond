#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

GemzBond::Application.load_tasks

desc "delete all gz caches"
task :invalidate do
  sh "rm public/*.gz"
end

desc "recalculate all gz caches"
task :recalculate => :environment do
  ["prerelease_specs.4.8.gz", "specs.4.8.gz"].each do |index|
    to_write = FilterGems.from_gzipped_source(HttpHelper.get("#{Settings.rubygems}/#{index}").body)
    File.open("public/#{index}", "w") { |f| f.write(to_write) }
  end
end
