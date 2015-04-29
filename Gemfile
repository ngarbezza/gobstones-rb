source 'https://rubygems.org'

gem 'treetop', '~> 1.4'
gem 'rake', '~> 10.4'
gem 'error_handling_protocol', '~> 0.0.1'

group :test do
  gem 'autotest-standalone', '~> 4.5'
  gem 'rspec', '~> 3.1'
  gem 'simplecov', '~> 0.7', :require => false
end

gem 'coveralls', '~> 0.7', :require => false

if ENV['RM_INFO']
  gem 'debase'
  gem 'ruby-debug-ide'
end
