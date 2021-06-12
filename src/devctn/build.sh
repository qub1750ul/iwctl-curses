#!/bin/bash

set -o nounset
set -o errexit

function run
{
	buildah run "$wctn" "$@"
}

alias echop='echo "[devctn/build]"'

declare -r baseImage='docker.io/library/alpine:3.13'
declare -r imageName="iwctl-curses-devctn"
declare wctn

echop "Starting devctn build script"
echop "Instatiating base image"
echo  ''

wctn=$( buildah from "$baseImage" )

echo  ''
echop "Starting local build"
echop "- Working container name: $wctn"
echop "- Final image name: $imageName"
echo  ''

run -- apk update
run -- apk upgrade
run -- apk add bash gcc make

echo  ''
echop "Build complete"
echop "Creating final image & cleaning up"
echo  ''

buildah commit --rm "$wctn" "$imageName"

echo ''
echop "Done"
echo ''