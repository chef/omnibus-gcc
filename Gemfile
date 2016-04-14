source 'https://rubygems.org'

gem 'omnibus',          github: 'opscode/omnibus'
gem 'omnibus-software', path: '../omnibus-software'

# pedump pessimistically pins multipart-post to a version from 2013 which makes
# bundler very unhappy. Remove this when upstream has merged zed-0xff/pedump#6 .
gem 'pedump', git: 'https://github.com/ksubrama/pedump.git', branch: 'patch-1'

gem 'berkshelf', '~> 4.0'

group :development do
  gem 'test-kitchen',      '~> 1.7.0' #github: 'test-kitchen/test-kitchen'
  gem 'kitchen-vagrant',   '~> 0.19'
  gem 'kitchen-ec2'
  gem 'winrm-transport',   '~> 1.0'
  gem 'winrm-fs'
end
