source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.7.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '6.1.7'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
#Bootstrap support
gem 'bootstrap', '~> 4.0.0'
#Jquery support
gem 'jquery-rails'
#hirb console output formatting
gem 'hirb', '~> 0.7.3'

# kaminari pagination
gem 'kaminari', '~> 1.2.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Secure passwords
gem 'bcrypt', '~> 3.1.7'

# Configure cors
gem 'rack-cors'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Image transformation for active storage using variants.
gem 'image_processing', '~> 1.2'

# Token based authentication
gem 'jwt'

# Postgres database gem
# gem 'pg', '~> 0.18.4'
gem 'pg', '~> 1.5', '>= 1.5.9'

# Serializes ruby to json objects.
gem 'active_model_serializers', '~> 0.10.0'

gem 'mimemagic', github: 'mimemagicrb/mimemagic', ref: '01f92d86d15d85cfd0f20dabd025dcbd36a8a60f'

gem 'concurrent-ruby', '1.3.4'

gem 'webpacker'

gem "aws-sdk-s3", require: false

gem 'net-http'

gem "ffi", '1.16.3'



group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails', '~> 4.0'
  gem 'faker'
end

group :development do
  gem 'rubocop', '~> 0.76.0', require: false
  gem 'solargraph', group: :development
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'database_cleaner'
  gem 'rails-controller-testing'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "dockerfile-rails", ">= 1.7", :group => :development

gem "redis", "~> 5.4"
