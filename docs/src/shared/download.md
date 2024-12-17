```md
:::-> print.erb
## Download an example <%= tutorial_type %> application

How do you configure a CNB? Give them an application. While Dockerfile is procedural, buildpacks, are declarative. A buildpack will determine what your application needs to function by inspecting the code on disk.

For this example, we're using a pre-built <%= tutorial_type %> application. Download it now:

```

```
:::>- pre.erb $ git clone <%= app_url %>
:::>- pre.erb $ cd <%= dir_name %>
```

Verify you're in the correct directory:

```
:::>> $ ls -A
```

This tutorial was built using the following commit SHA:

```
:::>> $ git log --oneline | head -n1
```
