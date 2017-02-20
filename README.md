
# styli.sh

> text formatter and renderer for the shell

## overview

styli.sh is a formatting tool for shell programs, it also has the ability 
to write the formatted output to a file, or convert this output to a different format.

we [eat our own dog food][3]. that means you can delve into the code, 
and see how styli.sh is used (by itself) to format help/usage output.

## setup

1. include styli.sh in your awesome program as a [git submodule][1], or just copy the source.
1. `source` the [formatter][2] script before evaluating program output.

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
[3]: https://en.wikipedia.org/wiki/Eating_your_own_dog_food