source 'https://rubygems.org'
#ruby-2.1.1


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.17.1'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'
gem 'haml-rails', '~> 0.5.3'
gem "less-rails"
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git', branch: "bootstrap3"

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'pry', '~> 0.9.12.6'
  gem 'dotenv-rails'
end


group :test do
  gem 'rspec-rails', '~> 2.14.2'
  gem 'fabrication'
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
  gem 'shoulda', '~> 3.5.0'
  gem 'capybara', '~> 2.2.1'
  gem 'webmock', '~> 1.17.4'
end
