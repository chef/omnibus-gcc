source "https://rubygems.org"

gem "omnibus", git: "https://github.com/chef/omnibus", branch: "master"
gem "omnibus-software", git: "https://github.com/chef/omnibus-software", branch: "master"
gem "artifactory"

gem "pedump"

group :development do
  # Use Berkshelf for resolving cookbook dependencies
  gem "berkshelf", ">= 7.0"

  # We pin here to the last release Ohai so prevent more current chef coming in
  gem "ohai"

  # Use Test Kitchen with Vagrant for converging the build environment
  gem "test-kitchen", ">= 1.23"
  gem "kitchen-vagrant", ">= 1.3.1"
  gem "winrm-fs", "~> 1.0"
end
