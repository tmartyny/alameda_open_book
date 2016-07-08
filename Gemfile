source 'https://rubygems.org'


gem 'rails', '4.2.5'
gem 'pg', '~> 0.15'
# Use Goodreads to get book info
gem 'goodreads'
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use haml for templating
gem "haml-rails", "~> 0.9"

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt'

# Use Unicorn as the app server
gem 'unicorn'

# Use ElasticSearch for search
gem 'elasticsearch-rails'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails', '~> 3.4'
  gem 'shoulda-matchers', '~> 3.1'
  gem "factory_girl_rails", "~> 4.0"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
end
