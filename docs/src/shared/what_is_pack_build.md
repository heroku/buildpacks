## What does `pack build` do?

> [!NOTE]
> Skip ahead if you want to run the application first and get into the details later.

```
:::-> print.erb
When you run `pack build` with a builder, each buildpack runs a detection script to determine if it should be eligible to build the application. In our case the `<%= buildpack_name %>` buildpack found a `<%= dependency_file %>` file. As a result, the buildpack has enough information to install <%= language_name %> dependencies. You can view a list of the buildpacks used in the build output:
```


```
:::-> $ grep DETECTING -A5 ./build_output.txt
```

```
:::-> print.erb
After the detect phase, each buildpack will execute. Buildpacks can inspect your project, install files to disk, run commands, write environment variables, [and more](https://buildpacks.io/docs/for-buildpack-authors/). You can see some examples of that in the output above. For example, the <%= language_name %> buildpack installs dependencies from the `<%= dependency_file %>` automatically:
```

```
:::-> pre.erb $ grep "<%= install_cmd_grep %>" -m1 ./build_output.txt
```

If you’re familiar with Dockerfile you might know that [many commands in a Dockerfile will create a layer](https://dockerlabs.collabnix.com/beginners/dockerfile/Layering-Dockerfile.html). Buildpacks also use layers, but the CNB buildpack API provides for fine grained control over what exactly is in these layers and how they’re composed. Unlike Dockerfile, all images produced by CNBs [can be rebased](https://tag-env-sustainability.cncf.io/blog/2023-12-reduce-reuse-rebase-buildpacks/#reduce-reuserebase). The CNB api also improves on many of the pitfalls outlined in the satirical article [Write a Good Dockerfile in 19 'Easy' Steps](https://jkutner.github.io/2021/04/26/write-good-dockerfile.html).
