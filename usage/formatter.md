
## formatter

provides an abstract API for formatting shell output.

### usage

```sh
[env [FORMAT=terminal|markdown|raw]] ; source ./formatter
```

### flags

<dl>
	<dt><code>-h</code></dt>
	<dd>shows this help message.<br/></dd>
</dl>

### how to use
 
two possible ways:

- include the available `_t_*` tags within strings to wrap terms.
  tags must be closed with the appropriate `_t_*_off` tag.

- use the formatter functions, they can be piped, or accept arguments.

### examples

- **wrapping with tags**
  
  ```sh
  echo "this text will be ${_t_bold}bold${_t_bold_off}"
  echo "text can be ${_t_under}underlined${_t_under_off} as well"
  echo "color text in ${_t_fg_yellow}yellow${_t_fg_off} or ${_t_fg_blue}blue${_t_fg_off}"
  ```

- **using functions**
  
  ```sh
  echo "$(t_heading "foo")"
  echo "$(echo "foo" | t_heading)"
  echo "$(echo "foo" | t_heading | t_fg_yellow)"
  ```
  
  you can also skip the echo, and compose the formatter functions in any which way:
  
  ```sh
  echo "$(t_heading "foo" | t_fg_yellow)"
  ```

### gotcha's

- nesting formats may not behave as expected in the terminal mode, as some closing tags reset all formatting.

### references

- the colors used here are based on the [SMYCK color scheme](http://color.smyck.org/).

- they were converted to their xterm-256 ansi approximations with [colortrans.py](https://gist.github.com/MicahElliott/719710).



<br/><br/>
---
<sup><i>created with <b><a href="https://github.com/eliranmal/styli.sh">styli.sh</a></b></i></sup>
