# GCC Omnibus project

This project creates an omnibus package for GCC, which is targeted exclusively for the EL6 platform, since it has a very old version of GCC, which causes issues on some modern software. (Specifically software that requires the C++11 and later standards)

## Installation

You must have a sane Ruby environment with Bundler installed. Ensure all the required gems are installed:

```shell
$ bundle install --without development
```

## Usage

### Build

You create a platform-specific package using the `build project` command:

```shell
$ bundle exec omnibus build <PROJECT>
```

### Clean

You can clean up all temporary files generated during the build process with the `clean` command:

```shell
$ bundle exec omnibus clean <PROJECT>
```

Adding the `--purge` purge option removes **ALL** files generated during the build including the project install directory (`/opt/omnibus-gcc`) and the package cache directory (`/var/cache/omnibus/pkg`):

```shell
$ bundle exec omnibus clean <PROJECT> --purge
```

### Publish

Omnibus has a built-in mechanism for releasing to a variety of "backends", such as Amazon S3 and Artifactory. You must set the proper credentials in your `omnibus.rb` config file or specify them via the command line.

```shell
$ bundle exec omnibus publish path/to/*.deb --backend s3
```

### Help

Full help for the Omnibus command line interface can be accessed with the `help` command:

```shell
$ bundle exec omnibus help
```

## Kitchen-based Build Environment

Every Omnibus project ships will a project-specific [Berksfile](https://docs.chef.io/berkshelf.html) that will allow you to build your omnibus projects on all of the projects listed in the `kitchen.yml`. You can add/remove additional platforms as needed by changing the list found in the `kitchen.yml` `platforms` YAML stanza.

This build environment is designed to get you up-and-running quickly. However, there is nothing that restricts you to building on other platforms. Simply use the [omnibus cookbook](https://github.com/chef-cookbooks/omnibus) to setup your desired platform and execute the build steps listed above.

The default build environment requires Test Kitchen and VirtualBox for local development. Test Kitchen also exposes the ability to provision instances using various cloud providers like AWS, DigitalOcean, or OpenStack. For more information, please see the [Test Kitchen documentation](http://kitchen.ci).

Once you have tweaked your `kitchen.yml` (or `kitchen.local.yml`) to your liking, you can bring up an individual build environment using the `kitchen` command.

```shell
$ bundle exec kitchen converge omnibus-gcc-centos-6
```

Then login to the instance and build the project as described in the Usage section:

```shell
$ kitchen login omnibus-gcc-centos-6
[vagrant@ubuntu...] $ source load-omnibus-toolchain.sh
[vagrant@ubuntu...] $ cd omnibus-gcc
[vagrant@ubuntu...] $ bundle install --without development # Don't install dev tools!
[vagrant@ubuntu...] $ ...
[vagrant@ubuntu...] $ bundle exec omnibus build omnibus-gcc -l internal
```

For a complete list of all commands and platforms, run `kitchen list` or `kitchen help`.

## License

```text
Copyright 2019, Chef Software, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```