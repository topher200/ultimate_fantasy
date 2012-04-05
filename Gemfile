source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'jquery-rails'
gem 'thin'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

group :development do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'newrelic_rpm'
end
