source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'figgy'
gem 'newrelic_rpm'
gem 'puma',  '~> 3.12'
gem 'rails', '~> 5.1'
gem 'rubocop'
gem 'twilio-ruby'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'whenever', require: false

group :development, :test do
  gem 'byebug',    platforms: %i[mri mingw x64_mingw]
  gem 'coveralls', require: false
  gem 'rspec-rails'
  gem 'simplecov', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
