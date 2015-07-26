# Fast Bundler Demo

See: https://github.com/byroot/bundler/tree/experimental-fast-setup

To have any relevance, you must add gems to your gemfile.

### Results:

For a plain new Rails app with 53 gems, the improvement is barely 4%:

```sh
$ bundle install
Bundle complete! 11 Gemfile dependencies, 53 gems now installed

$ ./script/benchmark
== Booting without cache:
RequireCache disabled
$LOAD_PATH.size => 77
        1.73 real         1.47 user         0.24 sys

== Warming cache (unless already present):
RequireCache enabled
$LOAD_PATH.size => 26
        1.67 real         1.47 user         0.18 sys

== Fast boot:
RequireCache enabled
$LOAD_PATH.size => 26
        1.67 real         1.47 user         0.19 sys
```

But for a sligthly bigger app with 136 gems, the app boot 20% faster.

```sh
$ bundle install
Bundle complete! 65 Gemfile dependencies, 136 gems now installed.

$ ./script/benchmark
== Booting without cache:
RequireCache disabled
$LOAD_PATH.size => 184
        3.29 real         2.59 user         0.69 sys

== Warming cache (unless already present):
RequireCache enabled
$LOAD_PATH.size => 39
        2.74 real         2.44 user         0.29 sys

== Fast boot:
RequireCache enabled
$LOAD_PATH.size => 39
        2.62 real         2.33 user         0.27 sys
```

I tested it with a real world app with 324 gems and lots of initializers, the saving is around 25%.

```sh
RequireCache disabled
$LOAD_PATH.size => 439
     14.14 real        10.85 user         3.19 sys

RequireCache enabled
$LOAD_PATH.size => 95
     10.79 real         9.52 user         1.18 sys
```

Usage:

```sh
bundle install
./script/benchmark
```
