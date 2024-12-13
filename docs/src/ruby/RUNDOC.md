```ruby
:::-- rundoc.require "../shared/setup.md"
:::-- print.erb
<%
  setup(
    app_url: "https://github.com/heroku/ruby-getting-started",
    tutorial_type: "Ruby on Rails",
    buildpack_name: "heroku/ruby",
    dependency_file: "Gemfile",
    language_name: "Ruby",
    install_cmd_grep: "bundle install",
    which_binary: "ruby"
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
