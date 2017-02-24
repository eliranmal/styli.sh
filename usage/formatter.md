
## formatter

utilities for shell output formatting.

### usage

```sh
[env FORMAT=terminal|markdown|raw ;] source ./formatter
```

```sh
./formatter -h
```

### flags

<dl>
	<dt><code>-h</code></dt>
	<dd>shows this help message.<br/></dd>
</dl>

### API
 
when the formatter is sourced, it exposes an API composed of two parts; tag variables, and functions.

### tags 

include the available `_f_[tag-name]` tags within strings to wrap terms.
tags must be closed with the appropriate `_f_[tag-name]_off` tag.

### functions 

include the available `_f_[tag-name]` tags within strings to wrap terms.
tags must be closed with the appropriate `_f_[tag-name]_off` tag.

### examples

- **wrapping with tags**  
  ```sh
  echo "${_f_bold}this text will be bold${_f_bold_off}"
  echo "text can be ${_f_under}underlined${_f_under_off} as well"
  echo "color me ${_f_fg_yellow}yellow${_f_fg_off}"
  ```

- **using functions**  
  ```sh
  echo "$(f_heading "foo")"
  echo "$(echo "foo" | f_heading)"
  echo "$(echo "foo" | f_heading | f_fg_yellow)"
  ```
  
  you can also skip the echo, and compose most of the formatter functions in any which way:
  
  ```sh
  echo "$(f_heading "foo" | f_fg_yellow)"
  ```
  
  
  ```sh
  echo "$(f_fg_yellow "foo" | f_bold | f_under)"
  ```
  
  
  some formatter functions cannot be composed, but can still be used regardless:
  
  ```sh
  echo "$(f_fg_rainbow "the quick brown fox jumps over the lazy dog")"
  ```
  

### gotcha's

- nesting formats may not behave as expected with the `terminal` format, as some closing tags reset all formatting.
- heavy use of formatter functions will impact performance, so use them wisely.

### references

- the colors used here are based on the [SMYCK color scheme](http://color.smyck.org/).
- the hex color values from SMYCK were converted to their xterm-256 ansi approximations with [colortrans.py](https://gist.github.com/MicahElliott/719710).



<br/><br/>
---
<sup><i>created with <b><a href="https://github.com/eliranmal/styli.sh">styli.sh</a></b></i></sup>
