load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def http_parser_deps():
    if "com_github_nodejs_http_parser" not in native.existing_rules():
        http_archive(
            name = "com_github_nodejs_http_parser",
            # This commit includes fix for
            # https://github.com/nodejs/http-parser/issues/517 which
            # allows (opt-in) to serve requests with both
            # Content-Legth and Transfer-Encoding: chunked headers
            # set.
            urls = ["https://github.com/nodejs/http-parser/archive/4f15b7d510dc7c6361a26a7c6d2f7c3a17f8d878.tar.gz"],
            sha256 = "6a12896313ce1ca630cf516a0ee43a79b5f13f5a5d8143f56560ac0b21c98fac",
            strip_prefix = "http-parser-4f15b7d510dc7c6361a26a7c6d2f7c3a17f8d878",
            build_file = "@com_github_3rdparty_bazel_rules_http_parser//http-parser:BUILD.bazel",
        )
