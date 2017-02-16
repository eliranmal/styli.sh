#!/usr/bin/env bash


main() {
	local source_dir="$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )"
	local root_dir="$source_dir"'/..'
	local output_dir="$root_dir"'/usage'
	local output_format="markdown"
	local files="
		renderer
		formatter
	"

	for f in $files; do
		(   export FORMAT="$output_format" OUTPUT_PATH="$output_dir"'/'"$f"'.'"md";
			${root_dir}/${f} -h | ${root_dir}/renderer  )
	done
}

main
