#
# Copyright:: Copyright (c) 2019 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "omnibus-gcc"
friendly_name "Omnibus GCC"
maintainer "Chef Software Inc"
homepage   "https://www.chef.io"
license "Apache-2.0"
license_file "LICENSE"

build_iteration 1
# Do not use __FILE__ after this point, use current_file. If you use __FILE__
# after this point, any dependent defs (ex: angry-omnibus-toolchain) that
# use instance_eval will fail to work correctly.
current_file ||= __FILE__
version_file = File.expand_path("../../../VERSION", current_file)
build_version IO.read(version_file).strip

install_dir "#{default_root}/#{name}"

# creates required build directories
dependency 'preparation'

dependency "gcc"

exclude '\.git*'
exclude 'bundler\/git'

package :rpm do
  signing_passphrase ENV["OMNIBUS_RPM_SIGNING_PASSPHRASE"]
end