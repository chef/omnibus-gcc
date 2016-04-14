source 'https://supermarket.chef.io'

#source 'https://api.berkshelf.com'

# The apt cookbook is required to bring the apt cache up-to-date on Ubuntu
# systems, since the cache can become stale on older boxes.
#cookbook 'apt', '~> 2.0'

# cookbook 'omnibus',
#          git: 'git@github.com:chef-cookbooks/omnibus.git',
#          branch: 'shain/s3_bucket_toolchain'

cookbook 'omnibus'
cookbook 'chef-ingredient',
         git: 'git@github.com:chef-cookbooks/chef-ingredient.git',
         branch: 'master'

cookbook 'apt'
cookbook 'yum-epel'
cookbook 'freebsd'
