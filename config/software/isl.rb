#
# Copyright 2012-2016 Chef Software, Inc.
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

name "isl"
default_version "0.16.1"

dependency "gmp"

version("0.16.1")      { source md5: "ac1f25a0677912952718a51f5bc20f32" }

source url: "ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-#{version}.tar.bz2"

relative_path "isl-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  configure_command = ["./configure",
                     "--prefix=#{install_dir}/embedded"]


  command configure_command.join(" "), env: env

  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end
