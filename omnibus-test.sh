    
#!/bin/bash

version=$(cat VERSION)

curl "https://packages.chef.io/files/unstable/omnibus-gcc/${version}/el/6/omnibus-gcc-${version}-1.el6.x86_64.rpm" -O
sudo yum install "omnibus-gcc-${version}-1.el6.x86_64.rpm" -y
rm -f "omnibus-gcc-${version}-1.el6.x86_64.rpm"

/opt/omnibus-gcc/embedded/bin/gcc --version | grep "4.9.2"