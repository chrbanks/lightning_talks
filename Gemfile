source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'sqlite3'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'ruby-saml', '~> 1.3.0'
gem 'kabu-rails', git: 'git@cagit.careerbuilder.com:CorpAppsCB/kabu-rails.git'
gem 'typhoeus', '0.6.9'
gem 'active_service', git: 'git@cagit.careerbuilder.com:CorpAppsCB/activeservice.git'
gem 'gravtastic'
gem 'okcomputer'
gem 'faker'
gem 'kaminari'
gem 'acts_as_commentable'
gem 'acts-as-taggable-on'
gem 'html-pipeline'
gem 'github-markdown'
gem 'html-pipeline-rouge_filter'
gem 'gemoji'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :staging, :production do
	gem 'passenger', '5.0.30'
end

group :test do
  gem 'shoulda-matchers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
