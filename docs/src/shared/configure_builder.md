## Configure the default pack builder

Once `pack` is installed, the only configuration you'll need for this tutorial is to set a default builder:

```
:::-- $ docker pull heroku/builder:26
:::-- $ docker pull heroku/heroku:26
:::>> $ pack config default-builder heroku/builder:26
```

You can view your default builder at any time:

```
:::>> $ pack config default-builder
```

> Note: The `heroku/builder:26` builder supports both amd64 (also known as x86) and arm64 (such as aarch64 used with newer Mac machines) architectures. If needed, you can configure the architecture for `docker` and `pack` CLIs using the `--platform` argument if needed. For example `--platform linux/amd64`.
