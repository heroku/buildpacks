## Configuring multiple languages

```md
:::-> print.erb
Language support is provided by individual buildpacks that are shipped with the builder. The above example uses the `<%= buildpack_name %>` buildpack which is [visible on GitHub](<%= buildpack_url %>). When you execute `pack build` with a builder, every buildpack has the opportunity to "detect" if it should execute against that project. The `<%= buildpack_name %>` buildpack looks for a <%= dependency_file %> file in the root of the project and if found, knows how to detect a <%= which_binary %> version and install dependencies.
```

In addition to this auto-detection behavior, you can specify buildpacks through the `--buildpack` flag with the `pack` CLI or through a [project.toml](https://buildpacks.io/docs/for-app-developers/how-to/build-inputs/specify-buildpacks/) file at the root of your application.

For example, if you wanted to install both Ruby and Node.js you could create a `project.toml` file in the root of your application and specify those buildpacks.

```toml
:::>> file.write project.toml
[_]
schema-version = "0.2"
id = "sample.ruby+nodejs.app"
name = "Sample Ruby & NodeJS App"
version = "1.0.0"

[[io.buildpacks.group]]
uri = "heroku/nodejs"

[[io.buildpacks.group]]
uri = "heroku/ruby"

[[io.buildpacks.group]]
uri = "heroku/procfile"
```

Ensure that a Node.js dependency file, such as `package.json` is in the root directory, and then build your application:

```
$ pack build my-image-name --path .
:::-- $ echo "{}" > package.json
:::-- $ docker rmi -f my-image-name
:::-> $ pack build my-image-name --path . --pull-policy if-not-present --clear-cache
```

You can run the image and inspect everything is installed as expected:

```
$ docker run -it --rm my-image-name bash
$ which node
:::-> $ docker run --rm my-image-name "which node"
```
