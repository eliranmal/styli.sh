
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
	<dd>shows this help message. works only when the script is executed (not sourced).<br/></dd>
</dl>

### API
 
when the formatter is sourced, it exposes an API composed of two parts; tags and functions.

some tags or functions will only be applied in a certain format, e.g. `terminal`. in such cases, the available formats will be  marked in the description body, with **available in: <formats...>**.
if no available formats are mentioned, the rendering will apply on all formats.

### tags 

tags are predefined variables that can be used to format text terms.
wrap the terms with a start tag in the form `_f_[name]`, and a close tag in the form `_f_[name]_off`.

the definitions below describe only the start tag, for brevity.

<dl>
	<dt><code>_f_bold</code></dt>
	<dd>formats the text as bold.<br/></dd>
</dl>

<dl>
	<dt><code>_f_italic</code></dt>
	<dd>formats the text as italics.<br/></dd>
</dl>

<dl>
	<dt><code>_f_strike</code></dt>
	<dd>formats the text as strike-through.<br/></dd>
</dl>

<dl>
	<dt><code>_f_code</code></dt>
	<dd>formats the text as inline code.<br/></dd>
</dl>

<dl>
	<dt><code>_f_code</code></dt>
	<dd>formats the text as inline code.<br/></dd>
</dl>

<dl>
	<dt><code>_f_sub</code></dt>
	<dd>formats the text as inline code.<br/></dd>
</dl>

<dl>
	<dt><code>_f_fg_[color]</code></dt>
	<dd>applies foreground color to the text.<br/></dd>
</dl>

<dl>
	<dt><code>_f_bg_[color]</code></dt>
	<dd>applies background color to the text.<br/></dd>
</dl>

### functions 

most of the tag variables has equivalent functions. they all follow the `f_[name]()` convention.

formatter functions can be piped, or accept arguments. those that can do both, 
with no side effects, will be marked with **composeable**.

<dl>
	<dt><code>f_bold(string...)</code></dt>
	<dd><strong><sup>composeable</sup></strong><br/>
formats passed arguments as bold text.<br/></dd>
</dl>

<dl>
	<dt><code>f_italic(string...)</code></dt>
	<dd><strong><sup>composeable</sup></strong><br/>
formats passed arguments as italics text.<br/></dd>
</dl>

<dl>
	<dt><code>f_strike(string...)</code></dt>
	<dd><strong><sup>composeable</sup></strong><br/>
formats passed arguments as strike-through text.<br/></dd>
</dl>

<dl>
	<dt><code>f_under(string...)</code></dt>
	<dd><strong><sup>composeable</sup></strong><br/>
<sup>available in: <strong>terminal</strong></sup><br/>
formats passed arguments as underlined text.<br/></dd>
</dl>

<dl>
	<dt><code>f_code(string...)</code></dt>
	<dd><strong><sup>composeable</sup></strong><br/>
formats passed arguments as inline code.<br/>
note to always pass arguments with <code>'strong quoting'</code>, or properly escape them, to avoid arbitrary code being interpreted by the shell.<br/></dd>
</dl>

<dl>
	<dt><code>f_link([name], target)</code></dt>
	<dd>formats passed arguments as an inline link. if <code>name</code> is passed, it will be used in the markdown format to name the link. the target will be used as the link ref.<br/></dd>
</dl>

<dl>
	<dt><code>f_fg_[color](string...)</code></dt>
	<dd><strong><sup>composeable</sup></strong><br/>
<sup>available in: <strong>terminal</strong></sup><br/>
applies foreground color to passed arguments. e.g. <code>f_fg_red("my text")</code>.<br/></dd>
</dl>

<dl>
	<dt><code>f_bg_[color](string...)</code></dt>
	<dd><strong><sup>composeable</sup></strong><br/>
<sup>available in: <strong>terminal</strong></sup><br/>
applies background color to passed arguments. e.g. <code>f_bg_red("my text")</code><br/></dd>
</dl>

<dl>
	<dt><code>f_heading(string)</code></dt>
	<dd><strong><sup>composeable</sup></strong><br/>
formats the passed <code>string</code> as heading.<br/></dd>
</dl>

<dl>
	<dt><code>f_subheading(string)</code></dt>
	<dd><strong><sup>composeable</sup></strong><br/>
formats the passed <code>string</code> as subheading.<br/></dd>
</dl>

<dl>
	<dt><code>f_list_item([title], body)</code></dt>
	<dd>formats passed arguments as a list item. if <code>title</code> is passed, it will appear as the list item's first line, and will be styled as bold.<br/></dd>
</dl>

<dl>
	<dt><code>f_definition(term, description)</code></dt>
	<dd>formats passed arguments as a definition list item. <code>term</code> is used as the item's term, and <code>description</code> is used as the item's description (its body content).<br/>
note that only <code>inline code</code> and <strong>bold</strong> styles are allowed to be nested inside definition list items.<br/></dd>
</dl>

<dl>
	<dt><code>f_code_definition(term, description)</code></dt>
	<dd>same as <code>f_definition()</code>, except <code>term</code> is formatted as inline code.<br/></dd>
</dl>

<dl>
	<dt><code>f_code_block([lang], body)</code></dt>
	<dd>formats passed arguments as a code block. if <code>lang</code> is passed, it will be used in the markdown format to highlight the code block. allowed <code>lang</code> values are those allowed in github-flavored markdown code blocks.<br/>
note to always enclose the passed <code>body</code> in <code>'strong quotes'</code>, or properly escape it, to avoid arbitrary code being interpreted by the shell.<br/></dd>
</dl>

<dl>
	<dt><code>f_output(body)</code></dt>
	<dd>formats passed arguments as an output block. in markdown this is the same as <code>f_code_block</code>, and in terminal every line of the body will be prefixed with an arrow, to mark code output.<br/></dd>
</dl>

<dl>
	<dt><code>f_if(format, content)</code></dt>
	<dd>only renders the <code>content</code> if the current format matches the passed <code>format</code>.<br/></dd>
</dl>

### colors

here are the available color names to be used with the color formatting tags and functions:

```
red
green
yellow
blue
magenta
cyan
lightred
lightgreen
lightyellow
lightblue
lightmagenta
lightcyan
```

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
  
  you can also skip the inner echo, if you're using composeable functions:
  
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
