```ruby
:::-- rundoc.require "../shared/setup.md"
:::-- print.erb
<%
  setup(
    app_url: "https://github.com/heroku/gradle-getting-started",
    which_binary: "java", # Executable on disk after buildpack i.e. `which ruby`
    tutorial_type: "Java (Gradle)", # Type of app "Ruby on Rails" tutorial
    language_name: "Java", # Buildpack name Heroku "Ruby" buildpack
    buildpack_url: "https://github.com/heroku/buildpacks-jvm",
    buildpack_name: "heroku/java", # Name of buildpack in registry
    dependency_file: "build.gradle.kts", # File needed for detection
    install_cmd_grep: "compileJava", # A command (or other string) notable in the build output
    fir_tutorial_url: "https://devcenter.heroku.com/articles/getting-started-with-java-gradle-fir"
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
:::>> rundoc.require "../shared/procfile.md"
:::>> rundoc.require "../shared/cleanup.md"
```
