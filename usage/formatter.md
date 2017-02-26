
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

include the available `_f_[name]` tags within strings to wrap terms.
tags must be closed with the appropriate `_f_[name]_off` tag.

### functions 

most of the tag variables has equivalent functions. they all follow the `f_[name]()` convention.

formatter functions can be piped, or accept arguments. those that can do both, 
with no side effects, will be marked with **composeable**.

some formatters will only be rendered in a certain format, e.g. 'terminal'. in such cases, the available formats are marked in each function description, under **formats: ...**.
if no formats are mentioned, the rendering will apply on all formats.

<dl>
	<dt><code>f_bold(string...)</code></dt>
	<dd><strong>composeable</strong><br/>
applies bold style to the passed arguments.<br/></dd>
</dl>

<dl>
	<dt><code>f_italic(string...)</code></dt>
	<dd><strong>composeable</strong><br/>
applies italics style to the passed arguments.<br/></dd>
</dl>

<dl>
	<dt><code>f_strike(string...)</code></dt>
	<dd><strong>composeable</strong><br/>
applies strike-through style to the passed arguments.<br/></dd>
</dl>

<dl>
	<dt><code>f_code(string...)</code></dt>
	<dd><strong>composeable</strong><br/>
applies code style to the passed arguments. always pass arguments with 'strong quoting', to avoid values being interpreted by the shell.<br/></dd>
</dl>

<dl>
	<dt><code>f_under(string...)</code></dt>
	<dd><strong>composeable</strong><br/>
formats: <strong>terminal</strong><br/>
applies underline style to the passed arguments.<br/></dd>
</dl>

<dl>
	<dt><code>f_fg_[color](string...)</code></dt>
	<dd><strong>composeable</strong><br/>
formats: <strong>terminal</strong><br/>
applies foreground color to the passed arguments. e.g. f_fg_red("my text")<br/></dd>
</dl>

<dl>
	<dt><code>f_bg_[color](string...)</code></dt>
	<dd><strong>composeable</strong><br/>
formats: <strong>terminal</strong><br/>
applies background color to the passed arguments. e.g. f_bg_red("my text")<br/></dd>
</dl>

<dl>
	<dt><code>f_heading(string)</code></dt>
	<dd><strong>composeable</strong><br/>
applies heading style to the passed argument.<br/></dd>
</dl>

<dl>
	<dt><code>f_subheading(string)</code></dt>
	<dd><strong>composeable</strong><br/>
applies subheading style to the passed argument.<br/></dd>
</dl>

<dl>
	<dt><code>f_list_item([title], body)</code></dt>
	<dd>applies list item style. if <code>title</code> is passed, it will appear as the list item's first line, and will be styled as bold.<br/></dd>
</dl>

<dl>
	<dt><code>f_definition(term, description)</code></dt>
	<dd>applies definition list item style. <code>term</code> is used as the item's term, and <code>description</code> is used as the item's description (its body content).<br/></dd>
</dl>

<dl>
	<dt><code>f_code_definition(term, description)</code></dt>
	<dd>same as <code>f_definition()</code>, except the term is formatted as inline code.<br/></dd>
</dl>

<dl>
	<dt><code>f_code_block([lang], body)</code></dt>
	<dd>applies code block style. if <code>lang</code> is passed, it will be used in the markdown format to highlight the code block. allowed <code>lang</code> values can be found [linguist languages yaml](https://github.com/github/linguist/blob/master/lib/linguist/languages.yml).<br/>
always enclose the <code>body</code> in 'strong quotes', to avoid values being interpreted by the shell.<br/></dd>
</dl>

<dl>
	<dt><code>f_link([name], target)</code></dt>
	<dd>applies link style. if <code>name</code> is passed, it will be used in the markdown format to name the link, and the target will be used as the link ref.<br/></dd>
</dl>

<dl>
	<dt><code>f_output(body)</code></dt>
	<dd>applies output block style. in markdown this is the same as <code>f_code_block</code>, and in terminal every line of the body will be prefixed with an arrow, to mark code output.<br/></dd>
</dl>

<dl>
	<dt><code>f_if(format, content)</code></dt>
	<dd>only renders the <code>content</code> if the current format matches the passed <code>format</code>.<br/></dd>
</dl>

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
