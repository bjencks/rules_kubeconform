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

def _shell_cmd(cmd):
    fmt = " \\\n  ".join(cmd)
    return "#!/bin/sh\n{}\n".format(fmt)

def _kubeconform_test_impl(ctx):
    info = ctx.toolchains["//:toolchain_type"].kubeconforminfo
    cmd = [info.binary.short_path]
    rf = [info.binary]
    for loc in ctx.attr.schema_locations:
        cmd.extend(["-schema-location", "'{}'".format(loc)])
    cmd.append(ctx.file.src.short_path)
    rf.append(ctx.file.src)
    out = ctx.actions.declare_file(ctx.label.name + ".kctest")
    ctx.actions.write(
        output = out,
        is_executable = True,
        content = _shell_cmd(cmd),
    )
    return DefaultInfo(
        executable = out,
        runfiles = ctx.runfiles(files = rf),
    )

kubeconform_test = rule(
    attrs = {
        "src": attr.label(allow_single_file = True),
        "schema_locations": attr.string_list(),
    },
    executable = True,
    test = True,
    implementation = _kubeconform_test_impl,
    toolchains = ["//:toolchain_type"],
)
