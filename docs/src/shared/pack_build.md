## Build the application image with the pack CLI

Now build an image named `my-image-name` by executing the heroku builder against the application by running the
`pack build` command:

```
$ pack build my-image-name --path .
:::-- $ docker rmi -f my-image-name
:::-- $ pack build my-image-name --path . --pull-policy if-not-present --clear-cache 2>&1 | tee build_output.txt
:::-> $ cat build_output.txt | sed --regexp-extended -e '/Fetching gem metadata/,/Bundle complete/d' -e "/$(date --iso)/d" -e 's/Done \(.+s\)/Done/' -e 's/\.\.\.+ \(.+s\)/.../' -e 's/\b[0-9a-f]{12}\b/abcdef012345/'
```

> [!NOTE]
> Your output may differ.

Verify that you see “Successfully built image my-image-name” at the end of the output. And verify that the image is present locally:

```
$ docker image ls --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}" | grep my-image-name
:::-> $ docker image ls --format "table abcdef012345\t{{.Repository}}\t{{.Tag}}" | grep my-image-name
```
