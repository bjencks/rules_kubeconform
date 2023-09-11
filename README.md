# [Kubeconform](https://github.com/yannh/kubeconform) rules for [Bazel](https://bazel.build)

This repository contains basic rules for [Bazel](https://bazel.build) that can
be used to run [Kubeconform](https://github.com/yannh/kubeconform) on YAML files
to test schema compliance.

## WORKSPACE setup

```
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bjencks_rules_kubeconform",
    urls = ["https://github.com/bjencks/rules_kubeconform/releases/download/v0.1/rules_kubeconform-0.1.tar.gz"],
    sha256 = "TBD",
)
load("@bjencks_rules_kubeconform//kubeconform:deps.bzl", "kubeconform_register")
kubeconform_register()
```

## Basic Examples

Test compliance of a simple YAML file:
```
load("@bjencks_rules_kubeconform//kubeconform:kubeconform.bzl", "kubeconform_test")

kubeconform_test(
    name = "my-file-test",
    src = "my-file.yaml",
)
```

# Disclaimer

This is not an officially supported Google product
