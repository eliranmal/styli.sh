
# styli.sh

> text formatter and renderer for the shell

## overview



## setup

1. include styli.sh in your awesome program as a [git submodule][1].
1. `source` the [formatter][2] script before evaluating any program output.

## usage

### formatter

// todo

### renderer

`source` the `main` file in your own repo, now you can generate usage files like this:

// todo - update this
```sh
env RENDER=true \
    FORMAT="markdown" \
    OUTPUT_PATH="./usage/cmd.md" \
    cmd -h # <- 'cmd' is your program
```





[1]: https://git-scm.com/book/en/v2/Git-Tools-Submodules
[2]: /formatter