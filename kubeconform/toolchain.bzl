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

KubeconformInfo = provider(
    doc = "Information about a kubeconform binary",
    fields = {
        "binary": "A label which points to the binary",
    },
)

def _kc_toolchain_impl(ctx):
    toolchain_info = platform_common.ToolchainInfo(
        kubeconforminfo = KubeconformInfo(
            binary = ctx.executable.binary,
        ),
    )
    return [toolchain_info]

kubeconform_toolchain = rule(
    implementation = _kc_toolchain_impl,
    attrs = {
        "binary": attr.label(
            allow_single_file = True,
            executable = True,
            cfg = "target",
        ),
    },
)
