
# styli.sh

> text formatter and renderer for the shell


## usage

### formatter

// todo

### renderer

`source` the `main` file in your own repo, now you can generate usage files like this:

```sh
env RENDER=true \
    FORMAT="markdown" \
    OUTPUT_PATH="./usage/cmd.md" \
    cmd -h # <- 'cmd' is your program
```
