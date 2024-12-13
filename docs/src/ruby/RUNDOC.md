```ruby
:::-- rundoc.require "../shared/setup.md"
:::-- print.erb
<%
  setup(
    app_url: "https://github.com/heroku/ruby-getting-started",
    which_binary: "ruby", # Executable on disk after buildpack i.e. `which ruby`
    tutorial_type: "Ruby on Rails", # Type of app "Ruby on Rails" tutorial
    language_name: "Ruby", # Buildpack name Heroku "Ruby" buildpack
    buildpack_url: "https://github.com/heroku/buildpacks-ruby",
    buildpack_name: "heroku/ruby", # Name of buildpack in registry
    dependency_file: "Gemfile", # File needed for detection
    install_cmd_grep: "bundle install", # A command (or other string) notable in the build output
    fir_tutorial_url: "https://devcenter.heroku.com/articles/getting-started-with-ruby-fir"
  )
%>
```

```
:::>> rundoc.require "../shared/intro.md"
:::>> rundoc.require "../shared/install_pack.md"
:::>> rundoc.require "../shared/configure_builder.md"
:::>> rundoc.require "../shared/what_is_a_builder.md"
:::>> rundoc.require "../shared/download.md"
:::>> rundoc.require "../shared/pack_build.md"
:::>> rundoc.require "../shared/what_is_pack_build.md"
:::>> rundoc.require "../shared/use_the_image.md"
:::>> rundoc.require "../shared/image_structure.md"
:::>> rundoc.require "../shared/call_to_action.md"
:::>> rundoc.require "./multiple_langs.md"
:::>> rundoc.require "../shared/procfile.md"
```
