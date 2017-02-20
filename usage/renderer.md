
usage:

```sh
( export FORMAT=<format> [OUTPUT_PATH=<output_path>] ; my-command -h | ./renderer )
```

## renderer

the styli.sh renderer.

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
	<dd>where to write to. defaults to <code>&lt;working-dir&gt;/output/&lt;cmd&gt;.&lt;ext&gt;</code>, where <code>&lt;cmd&gt;</code> is the command name that's piped to the renderer, and <code>&lt;ext&gt;</code> is a file extension resolved from the passed format.<br/></dd>
</dl>

- 

### what it does

the renderer's job is to read the formatted output of a program, and write it to a file.

### examples

- **auto resolve the output path**
  
  ```sh
  ( export FORMAT="markdown" ; ./foo -h | ./styli.sh/renderer )
  ```
  
  writes to `./output/foo.md`

- **be explicit about everything**
  
  ```sh
  ( export FORMAT="markdown" OUTPUT_PATH=./usage/bar.md ; ./foo -h | ./styli.sh/renderer )
  ```
  
  writes to `./usage/bar.md`



<br/><br/>
---
<sup><i>created with <b><a href="https://github.com/eliranmal/styli.sh">styli.sh</a></b></i></sup>
