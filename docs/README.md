# Using Heroku Buildpacks Locally

This section contains tutorials for using Heroku's Cloud Native Buildpacks (CNBs) to build and run an image locally.

## Use

- [Ruby CNB tutorial](docs/ruby/README.md)
- [.NET CNB tutorial](docs/dotnet/README.md)

## Development

Tutorials are built by executing dynamic scripts with the `rundoc` tool. Source code lives in `docs/src` for each different language.

From the root directory install RunDOC:

```
$ BUNDLE_GEMFILE="./.rundoc-workspace/Gemfile" bundle install
```

### Build Ruby

```
$ BUNDLE_GEMFILE="./.rundoc-workspace/Gemfile" bundle exec \
    rundoc docs/src/ruby/RUNDOC.md \
      --on-success-dir docs/ruby \
      --on-failure-dir docs/fail/ruby
```

### Build .NET

```
$ BUNDLE_GEMFILE="./.rundoc-workspace/Gemfile" bundle exec \
    rundoc docs/src/dotnet/RUNDOC.md \
      --on-success-dir docs/dotnet \
      --on-failure-dir docs/fail/dotnet
```

### Build Node.js

```
$ BUNDLE_GEMFILE="./.rundoc-workspace/Gemfile" bundle exec \
    rundoc docs/src/nodejs/RUNDOC.md \
      --on-success-dir docs/nodejs \
      --on-failure-dir docs/fail/nodejs
```
