# Copyright 2023 Google LLC
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

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def kubeconform_register():
    http_archive(
        name = "kubeconform_linux_amd64",
        url = "https://github.com/yannh/kubeconform/releases/download/v0.6.3/kubeconform-linux-amd64.tar.gz",
        sha256 = "478604fe85c711aafe8ef78c0bf25cb93fa46de5a3c07040f25a595096c43f8a",
        build_file = Label("//kubeconform:BUILD.repo"),
    )
    http_archive(
        name = "kubeconform_linux_arm64",
        url = "https://github.com/yannh/kubeconform/releases/download/v0.6.3/kubeconform-linux-arm64.tar.gz",
        sha256 = "58572ce673ac45ca5b0a2083f2289a0db67606187dd1ad8fec0caf4fc7432826",
        build_file = Label("//kubeconform:BUILD.repo"),
    )
    native.register_toolchains(
        "//kubeconform:kc_linux_amd64_toolchain",
        "//kubeconform:kc_linux_arm64_toolchain",
    )
