#!/usr/bin/env bash


main() {

	local source_dir="$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )"
	local root_dir="$source_dir"'/..'
	local output_dir="$root_dir"
	local output_format="markdown"

	(
		export FORMAT="$output_format" OUTPUT_PATH="$output_dir"'/kitchen-sink.md'
		${root_dir}/showcase | ${root_dir}/renderer
	)
}

main
