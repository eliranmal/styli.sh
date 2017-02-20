
## renderer

reads the formatted output of a program, and writes it to a file.

before the actual write, the output is passed through some transformers that strip-down and dress-up the text, e.g. get rid of redundant blank lines, or append an auto-generated message to the end of the file.

if you don't want to use the transformers, you can just skip the renderer and redirect your program's output directly to a file, after setting the desired format. for example:

```sh
env FORMAT=markdown ./my-command -h > ./usage/my-command.md
```

### usage

```sh
( export FORMAT=<format> OUTPUT_PATH=<output_path> ; <my-command> | ./renderer )
```

```sh
./renderer -h
```

### flags

<dl>
	<dt><code>-h</code></dt>
	<dd>shows this help message.<br/></dd>
</dl>

### environment

environment variables for the renderer must be declared using `export` (rather than `env`), in order to share them both with the renderer and the formatter in your program.

<dl>
	<dt><code>FORMAT</code></dt>
	<dd>which format to use. possible values: <code>markdown</code>, <code>terminal</code>, <code>raw</code>.<br/></dd>
</dl>

<dl>
	<dt><code>OUTPUT_PATH</code></dt>
	<dd>where to write to. value should be a full path, including file name and extension.<br/></dd>
</dl>

### examples

- **render a markdown file**
  
  ```sh
  ( export FORMAT="markdown" OUTPUT_PATH=./usage/bar.md ; ./foo -h | ./styli.sh/renderer )
  ```
  
  writes the markdown-formatted output of `./foo -h` to `./usage/bar.md`



<br/><br/>
---
<sup><i>created with <b><a href="https://github.com/eliranmal/styli.sh">styli.sh</a></b></i></sup>
