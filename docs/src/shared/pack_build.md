## Build the application image with the pack CLI

Now build an image named `my-image-name` by executing the heroku builder against the application by running the
`pack build` command:

```
:::-- $ docker rmi -f my-image-name
:::-- $ pack build my-image-name --path . --pull-policy if-not-present --clear-cache 2>&1 | tee build_output.txt
:::>> print.text $ pack build my-image-name --path .
:::>> print.erb
<%=
contents = File.read("build_output.txt").lines
if pack_build_head_tail
  (contents.first(pack_build_head_tail) +
    ["...\n"] +
    contents.last(pack_build_head_tail)
  )
else
  contents
end.join("") %>
```

> [!NOTE]
> Your output may differ.

Verify that you see “Successfully built image my-image-name” at the end of the output. And verify that the image is present locally:

```
:::>> $ docker image ls --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}" | grep my-image-name
```
