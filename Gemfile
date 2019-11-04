source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'bootstrap', '~> 4.3.1'
gem 'font-awesome-rails'
gem 'unicorn'

gem 'capistrano-rvm'
gem 'capistrano-bundler'
gem 'capistrano-rails'

gem 'dalli'
gem 'rucaptcha'
gem 'bcrypt', '~> 3.1.7'

gem 'rest-client', '~> 2.0'
gem 'turbolinks', '~> 5.0.0'

# 上传组件
gem 'carrierwave'
# 图片处理
gem 'mini_magick'

# 邮件发送
gem 'devise'
gem 'devise-i18n'
gem 'letter_opener_web'
gem 'figaro'

# 富文本编辑器
gem 'simditor'

# converting Markdown to HTML
# syntax highlighting
gem 'redcarpet'
gem 'coderay'

# QRCode
gem 'rqrcode'

gem 'dotenv-rails', require: 'dotenv/rails-now'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'

  gem 'database_cleaner', '~> 1.5.3'
  gem 'rspec-rails', '~> 3.5'
  gem 'rails-controller-testing'

  # FactoryGirl support for rspec
  gem "factory_bot_rails", "~> 4.0"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'capistrano', '~> 3.8'
  gem 'capistrano3-unicorn'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
