# Bazel build rules for http-parser
Follows a "repos/deps" pattern (in order to help with recursive dependencies). To use:

1. Copy `bazel/repos.bzl` into your repository at `3rdparty/bazel-rules-http-parser/repos.bzl` and add an empty `BUILD` (or `BUILD.bazel`) to `3rdparty/bazel-rules-http-parser` as well.

2. Copy all of the directories from `3rdparty` that you ***don't*** already have in ***your*** repository's `3rdparty` directory.

3. Either ... add the following to your `WORKSPACE` (or `WORKSPACE.bazel`):

```bazel
load("//3rdparty/bazel-rules-http-parser:repos.bzl", http_parser_repos="repos")
http_parser_repos()

load("@com_github_3rdparty_bazel_rules_http_parser//bazel:deps.bzl", http_parser_deps="deps")
http_parser_deps()
```

Or ... to simplify others depending on ***your*** repository, add the following to your `repos.bzl`:

```bazel
load("//3rdparty/bazel-rules-http-parser:repos.bzl", http_parser="repos")

def repos():
    http_parser()
```

And the following to your `deps.bzl`:

```bazel
load("@com_github_3rdparty_bazel_rules_http_parser//bazel:deps.bzl", http_parser="deps")

def deps():
    http_parser()
```

4. You can then use `@com_github_nodejs_http_parser//:http_parser` in your target's `deps`.

5. Repeat the steps starting at (1) at the desired version of this repository that you want to use.



