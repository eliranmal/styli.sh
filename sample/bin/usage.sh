#!/usr/bin/env bash


main() {
	local source_dir="$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )"
	local root_dir="$source_dir"'/..'

	( export FORMAT="markdown" OUTPUT_PATH="$root_dir"'/usage/app.md' ; ${root_dir}/app -h | ${root_dir}/../renderer )
}

main
