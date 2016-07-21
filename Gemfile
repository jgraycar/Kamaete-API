source 'https://rubygems.org'
ruby '2.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use Puma as the app server
gem 'puma', '~> 3.0'

# Use AMS to build JSON-API responses
# Must lock at rc4; 0.10.0 doesn't allow token auth headers to be injected into
# responses See https://github.com/lynndylanhurley/devise_token_auth/issues/600
#
# Issue last verified with 0.10.1 on 06/22/16
gem 'active_model_serializers', '~> 0.10.2'

# Use Devise Token Auth for token based authentication
# Since there have been no releases in a while, pull gem from source to get
# needed fixes.
gem 'devise_token_auth', '~> 0.1.38'

# Enable Cross-Origin Resource Sharing (CORS)
gem 'rack-cors'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  # Use RSpec for specs
  gem 'rspec-rails', '~> 3.0'

  # Use Factory Girl for generating random test data
  gem 'factory_girl_rails'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'overcommit'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
