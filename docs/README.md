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

### Build Python

```
$ BUNDLE_GEMFILE="./.rundoc-workspace/Gemfile" bundle exec \
    rundoc docs/src/python/RUNDOC.md \
      --on-success-dir docs/python \
      --on-failure-dir docs/fail/python/
```

### Build PHP

```
$ BUNDLE_GEMFILE="./.rundoc-workspace/Gemfile" bundle exec \
    rundoc docs/src/php/RUNDOC.md \
      --on-success-dir docs/php \
      --on-failure-dir docs/fail/php/
```

### Build Go

```
$ BUNDLE_GEMFILE="./.rundoc-workspace/Gemfile" bundle exec \
    rundoc docs/src/go/RUNDOC.md \
      --on-success-dir docs/go \
      --on-failure-dir docs/fail/go/
```

### Build Java (Maven)

```
$ BUNDLE_GEMFILE="./.rundoc-workspace/Gemfile" bundle exec \
    rundoc docs/src/java_maven/RUNDOC.md \
      --on-success-dir docs/java_maven \
      --on-failure-dir docs/fail/java_maven/
```

### Build Java (Gradle)

```
$ BUNDLE_GEMFILE="./.rundoc-workspace/Gemfile" bundle exec \
    rundoc docs/src/java_gradle/RUNDOC.md \
      --on-success-dir docs/java_gradle \
      --on-failure-dir docs/fail/java_gradle/
```

### Build Scala

```
$ BUNDLE_GEMFILE="./.rundoc-workspace/Gemfile" bundle exec \
    rundoc docs/src/scala/RUNDOC.md \
      --on-success-dir docs/scala \
      --on-failure-dir docs/fail/scala/
```
