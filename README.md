# Bazel build rules for http-parser

To use these rules, add the following to your `WORKSPACE` file:

```bazel
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "com_github_3rdparty_bazel_rules_http_parser",
    commit = "f7f0cf89dda5e867f262c19e7eb62da65971600d",
    remote = "https://github.com/3rdparty/bazel-rules-http-parser",
    shallow_since = "1616473116 -0700",
)

load("@com_github_3rdparty_bazel_rules_http_parser//:bazel/http-parser.bzl", "http_parser_deps")

http_parser_deps()
```

You can then use `@com_github_nodejs_http_parser//:http_parser` in your target's `deps`.
