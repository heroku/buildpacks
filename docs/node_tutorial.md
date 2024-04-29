# Cloud Native Buildpack Tutorial
Build a Node.js application image in 5 minutes, no Dockerfile required.

At the end of this tutorial, you'll have a working [OCI image](https://opencontainers.org/) of a Node.js application that can run locally. You will learn about the Cloud Native Buildpack (CNB) ecosystem, and how to utilize the [pack CLI](https://buildpacks.io/docs/for-platform-operators/how-to/integrate-ci/pack/) to build images without the need to write or maintain a Dockerfile.

## Install the pack CLI

We assume you have [docker installed](https://docs.docker.com/engine/install/) and a working copy [of git](https://github.com/git-guides/install-git). Next, you will need to install the CLI tool for building CNBs, [pack CLI](https://buildpacks.io/docs/for-platform-operators/how-to/integrate-ci/pack/). If you're on a Mac you can install it via Homebrew:

```
$ brew install buildpacks/tap/pack
```

Ensure that it is installed correctly:

```
$ pack --version
0.33.2+git-f2cffc4.build-5562
```

## Configure the default pack builder

Once `pack` is installed, the only configuration you'll need for this tutorial is to set a default builder:

```
$ pack config default-builder heroku/builder:22
Builder heroku/builder:22 is now the default builder
```

You can view your default builder at any time:

```
$ pack config default-builder
The current default builder is heroku/builder:22
```

## What is a builder?

> [!NOTE]
> Skip ahead if you want to build the application first and get into the details later. You won't need to
> know about builders for the rest of this tutorial.

In short, a builder is a delivery mechanism for buildpacks. A builder contains references to base images and individual buildpacks. A base image contains the operating system and system dependencies. Buildpacks are the components that will configure an image to run your application, that’s where the bulk of the logic lives and why the project is called “Cloud Native Buildpacks” and not “Cloud Native Builders.”

You can view the contents of a builder via the command `pack builder inspect`. For example:

```
$ pack builder inspect heroku/builder:22
# ...
Buildpacks:
  ID                                NAME                               VERSION        HOMEPAGE
  heroku/go                         Heroku Go                          0.1.16         https://github.com/heroku/buildpacks-go
  heroku/gradle                     Heroku Gradle                      4.1.0          https://github.com/heroku/buildpacks-jvm
  heroku/java                       Heroku Java                        4.1.0          https://github.com/heroku/buildpacks-jvm
  heroku/jvm                        Heroku OpenJDK                     4.1.0          https://github.com/heroku/buildpacks-jvm
  heroku/maven                      Heroku Maven                       4.1.0          https://github.com/heroku/buildpacks-jvm
  heroku/nodejs                     Heroku Node.js                     2.6.6          https://github.com/heroku/buildpacks-nodejs
  heroku/nodejs-corepack            Heroku Node.js Corepack            2.6.6          https://github.com/heroku/buildpacks-nodejs
  heroku/nodejs-engine              Heroku Node.js Engine              2.6.6          https://github.com/heroku/buildpacks-nodejs
  heroku/nodejs-npm-engine          Heroku Node.js npm Engine          2.6.6          https://github.com/heroku/buildpacks-nodejs
  heroku/nodejs-npm-install         Heroku Node.js npm Install         2.6.6          https://github.com/heroku/buildpacks-nodejs
  heroku/nodejs-pnpm-engine         Heroku Node.js pnpm Engine         2.6.6          https://github.com/heroku/buildpacks-nodejs
  heroku/nodejs-pnpm-install        Heroku Node.js pnpm install        2.6.6          https://github.com/heroku/buildpacks-nodejs
  heroku/nodejs-yarn                Heroku Node.js Yarn                2.6.6          https://github.com/heroku/buildpacks-nodejs
  heroku/php                        Heroku PHP                         0.1.2          https://github.com/heroku/buildpacks-php
  heroku/procfile                   Heroku Procfile                    3.0.0          https://github.com/heroku/buildpacks-procfile
  heroku/python                     Heroku Python                      0.8.2          https://github.com/heroku/buildpacks-python
  heroku/ruby                       Heroku Ruby                        2.1.2          https://github.com/heroku/buildpacks-ruby
  heroku/sbt                        Heroku sbt                         4.1.0          https://github.com/heroku/buildpacks-jvm
  heroku/scala                      Heroku Scala                       4.1.0          https://github.com/heroku/buildpacks-jvm
# ...
```

> [!NOTE]
> Your output version numbers may differ.

This output shows the various buildpacks that represent the different languages that are supported by this builder such as `heroku/go` and `heroku/nodejs-engine`.

## Download an example Node.js application

How do you configure a CNB? Give them an application. While Dockerfile is procedural, buildpacks, are declarative. A buildpack will determine what your application needs to function by inspecting the code on disk.

For this example, we're using a pre-built Node.js application. Download it now:

```
$ git clone https://github.com/heroku/node-js-getting-started
$ cd node-js-getting-started
```

Verify you're in the correct directory:

```
$ ls
Procfile        README.md        app.json        index.js        package-lock.json    package.json        public            test.js            views
```

Now build an image named `my-image-name` by executing the `heroku/builder:22` against the application by running the
`pack build` command:

```
$ pack build my-image-name --path .
22: Pulling from heroku/builder
Digest: sha256:5856c2e1f6c55ec5e289453b872f57f4ebe1a32a6da31f053cd27eddccbf21c5
Status: Image is up to date for heroku/builder:22
22-cnb: Pulling from heroku/heroku
01007420e9b0: Already exists
df2d2178126f: Already exists
aad43203853c: Already exists
7443f334f93e: Pull complete
4376f68108d7: Pull complete
Digest: sha256:ed04f7f3d8e423c90069416ccfdcd688cf0fa7edb9de57995b47d81c770fa169
Status: Downloaded newer image for heroku/heroku:22-nb
===> ANALYZING
Image with name "my-image-name" not found
===> DETECTING
3 of 5 buildpacks participating
heroku/nodejs-engine      2.6.6
heroku/nodejs-npm-install 2.6.6
heroku/procfile           3.0.0
===> RESTORING
===> BUILDING

[Heroku Node.js Engine Buildpack]

[Checking Node.js version]
Detected Node.js version range: >=20.0.0 <21.0.0-0
Resolved Node.js version: 20.11.1

[Installing Node.js distribution]
Downloading Node.js 20.11.1
Extracting Node.js 20.11.1
Installing Node.js 20.11.1

# Heroku Node.js npm Install Buildpack

- Installing node modules
  - Using npm version `10.2.4`
  - Creating npm cache
  - Configuring npm cache directory
  - Running `npm ci "--production=false"`

      npm WARN config production Use `--omit=dev` instead.

      added 153 packages, and audited 154 packages in 2s

      70 packages are looking for funding
        run `npm fund` for details

      found 0 vulnerabilities
      npm notice
      npm notice New minor version of npm available! 10.2.4 -> 10.5.0
      npm notice Changelog: <https://github.com/npm/cli/releases/tag/v10.5.0>
      npm notice Run `npm install -g npm@10.5.0` to update!
      npm notice

  - Done (2.629s)
- Running scripts
  - No build scripts found
- Configuring default processes
  - Adding default web process for `npm start`
- Done (finished in 4.061s)

[Discovering process types]
Procfile declares types -> web
===> EXPORTING
Adding layer 'heroku/nodejs-engine:dist'
Adding layer 'heroku/nodejs-engine:node_runtime_metrics'
Adding layer 'heroku/nodejs-engine:web_env'
Adding layer 'buildpacksio/lifecycle:launch.sbom'
Adding 1/1 app layer(s)
Adding layer 'buildpacksio/lifecycle:launcher'
Adding layer 'buildpacksio/lifecycle:config'
Adding layer 'buildpacksio/lifecycle:process-types'
Adding label 'io.buildpacks.lifecycle.metadata'
Adding label 'io.buildpacks.build.metadata'
Adding label 'io.buildpacks.project.metadata'
Setting default process type 'web'
Saving my-image-name...
*** Images (97b42d93c354):
      my-image-name
Adding cache layer 'heroku/nodejs-engine:dist'
Adding cache layer 'heroku/nodejs-npm-install:npm_cache'
Successfully built image my-image-name
```

> [!NOTE]
> Your output may differ.

Verify that you see “Successfully built image my-image-name” at the end of the output. And verify that the image is present locally:

```
$ docker image ls --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}" | grep my-image-name
16d18262dd4c   my-image-name             latest
```

## What does `pack build` do?

> [!NOTE]
> Skip ahead if you want to run the application first and get into the details later.

When you run `pack build` with a builder, each buildpack runs a detection script to determine if it should be eligible to build the application. In our case the `heroku/nodejs-engine` and `heroku/nodejs-npm-install` buildpacks found a `package.json` file on disk and reported that they knew how to install those dependencies. You can view a list of the buildpacks used in the output above:

```
===> DETECTING
3 of 5 buildpacks participating
heroku/nodejs-engine      2.6.6
heroku/nodejs-npm-install 2.6.6
heroku/procfile           3.0.0
```

After the detect phase, each buildpack will execute. Buildpacks can inspect your project, install files to disk, run commands, write environment variables, [and more](https://buildpacks.io/docs/for-buildpack-authors/). You can see some examples of that in the output above.

You can see that the Node binary is being downloaded:

```
[Installing Node.js distribution]
Downloading Node.js 20.11.1
```

Later you can see npm dependencies installed:

```
- Running `npm ci "--production=false"`

  npm WARN config production Use `--omit=dev` instead.

  added 153 packages, and audited 154 packages in 2s

  70 packages are looking for funding
    run `npm fund` for details

  found 0 vulnerabilities
  npm notice
  npm notice New minor version of npm available! 10.2.4 -> 10.5.0
  npm notice Changelog: <https://github.com/npm/cli/releases/tag/v10.5.0>
  npm notice Run `npm install -g npm@10.5.0` to update!
  npm notice

- Done (2.629s)
```

If you’re familiar with Dockerfile you might know that [many commands in a Dockerfile will create a layer](https://dockerlabs.collabnix.com/beginners/dockerfile/Layering-Dockerfile.html). Buildpacks also use layers, but the CNB buildpack API provides for fine grained control over what exactly is in these layers and how they’re composed. Unlike Dockerfile, all images produced by CNBs [can be rebased](https://tag-env-sustainability.cncf.io/blog/2023-12-reduce-reuse-rebase-buildpacks/#reduce-reuserebase). The CNB api also improves on many of the pitfalls outlined in the satirical article [Write a Good Dockerfile in 19 'Easy' Steps](https://jkutner.github.io/2021/04/26/write-good-dockerfile.html).

## Use the image

Even though we used `pack` and CNBs to build our image, it can be run with your favorite tools like any other OCI image. We will be using the `docker` command line to run our image.

By default, images will be booted into a web server configuration. You can launch the app we just built by running:

```
$ docker run -it --rm --env PORT=9292 -p 9292:9292 my-image-name
```

Now when you visit http://localhost:9292 you should see a working web application:

![Screenshot of Heroku's Node.js getting started app](nodejs-getting-started-screenshot.png)

Here's a quick breakdown of that command we just ran:

- `docker run` Create and run a new container from an image.
- `-it` Makes the container interactive and allocates a TTY.
- `--rm` Automatically remove the container when it exits.
- `--env PORT=9292` Creates an environment variable named `PORT` and sets it to `9292` this is needed so the application inside the container knows what port to bind the web server.
- `-p 9292:9292` Publishes a container's port(s) to the host. This is what allows requests from your machine to be received by the container.
- `my-image-name` The name of the image you want to use for the application.

So far, we've downloaded an application via git and run a single command `pack build` to generate an image, and then we can use that image as if it was generated via a Dockerfile via the `docker run` command.

In addition to running the image as a web server, you can access the container's terminal interactively. In a new terminal window try running this command:

```
$ docker run -it --rm my-image-name bash
```

Now you can inspect the container interactively. For example, you can see the npm version:

```
heroku@d97cd3f44535:/workspace$ npm --version
10.2.4
```

View files on disk:

```
heroku@d97cd3f44535:/workspace$ ls
Procfile  README.md  app.json  index.js  node_modules  package-lock.json  package.json    public    test.js  views
heroku@d97cd3f44535:/workspace$ cat Procfile
web: npm start
```

And anything else you would typically do via an interactive container session.

## Image structure under the hood

> [!NOTE]
> Skip this section if you want to try building your application with CNBs and learn about container structure later.

If you’re an advanced `Dockerfile` user you might be interested in learning more about the internal structure of the image on disk. You can access the image disk interactively by using the `bash` docker command above.

If you view the root directory `/` you’ll see there is a `layers` folder. Every buildpack that executes gets a unique folder. For example:

```
heroku@edc80579a982:/workspace$ ls /layers | grep node
heroku_nodejs-engine
```

Individual buildpacks can compose multiple layers from their buildpack directory. For example you can see that `npm` is present within that node buildpack directory under a layer named `dist`:

```
heroku@edc80579a982:/workspace$ which npm
/layers/heroku_nodejs-engine/dist/bin/npm
```

OCI images are represented as sequential modifications to disk. By scoping buildpack disk modifications to their own directory, the CNB API guarantees that changes to a layer in one buildpack will not affect the contents of disk to another layer. This means that OCI images produced by CNBs are rebaseable by default, while those produced by Dockerfile are not.

We saw before how the image booted a web server by default. This is accomplished using an entrypoint. In another terminal outside of the running container you can view that entrypoint:

```
$ docker inspect my-image-name | grep '"Entrypoint": \[' -A2
            "Entrypoint": [
                "/cnb/process/web"
            ],
```

From within the image, you can see that file on disk:

```
heroku@edc80579a982:/workspace$ ls /cnb/process/
web
```

While you might not need this level of detail to build and run an application with Cloud Native Buildpacks, it is useful to understand how they’re structured if you ever want to write your own buildpack.

## Try CNBs out on your application

So far we've learned that CNBs are a declarative interface for producing OCI images (like docker). They aim to be no to low configuration and once built, you can interact with them like any other image.

For the next step, we encourage you to try running `pack` with the Heroku builder against your application and let us know how it went. We encourage you to share your experience by [opening a discussion](https://github.com/heroku/buildpacks/discussions) and walking us through what happened:

- What went well?
- What could be better?
- Do you have any questions?

We are actively working on our Cloud Native Buildpacks and want to hear about your experience. The documentation below covers some intermediate-level topics that you might find helpful.

## Configuring multiple languages

Language support is provided by individual buildpacks that are shipped with the builder. The above example uses the `heroku/nodejs` buildpack which is [visible on GitHub](https://github.com/heroku/buildpacks-nodejs). When you execute `pack build` with a builder, every buildpack has the opportunity to "detect" if it should execute against that project. The `heroku/nodejs` buildpack looks for a `package.json` in the root of the project and if found, knows how to detect a node version and install dependencies.

In addition to this auto-detection behavior, you can specify buildpacks through the `--buildpack` flag with the `pack` CLI or through a [project.toml](https://buildpacks.io/docs/for-app-developers/how-to/build-inputs/specify-buildpacks/) file at the root of your application.

For example, if you wanted to install both Node.js and Python you could create a `project.toml` file in the root of your application:

```toml
[_]
schema-version = "0.2"
id = "sample.nodejs+python.app"
name = "Sample Nodejs & Python App"
version = "1.0.0"

[[io.buildpacks.group]]
uri = "heroku/python"

[[io.buildpacks.group]]
uri = "heroku/nodejs"

[[io.buildpacks.group]]
uri = "heroku/procfile"
```

Ensure that a `requirements.txt` file and a `package.json` file both exist and then build your application:

```
$ touch requirements.txt
$ pack build my-python-nodejs-image --path .
# ...
Successfully built image my-python-nodejs-image
```

You can run the image and inspect the dependencies:

```
$ docker run -it --rm my-python-nodejs-image bash
heroku@aef749405b22:/workspace$ python --version
Python 3.12.2
heroku@aef749405b22:/workspace$ node --version
v20.11.1
```

## Configuring your web process with the Procfile

Most buildpacks rely on existing community standards to allow you to configure your application declaratively. They can also implement custom logic based on file contents on disk or environment variables present at build time.

The `Procfile` is a configuration file format that was [introduced by Heroku in 2011](https://devcenter.heroku.com/articles/procfile), you can now use this behavior on your CNB-powered application via the `heroku/procfile`, which like the rest of the buildpacks in our builder [is open source](https://github.com/heroku/buildpacks-procfile). The `heroku/procfile` buildpack allows you to configure your web startup process.

This is the Procfile of the Node.js getting started guide:

```
web: npm start
```

By including this file and using `heroku/procfile` buildpack, your application will receive a default web process that calls `npm start`. You can configure this behavior by changing the contents of that file.
