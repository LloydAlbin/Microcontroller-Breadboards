#!/usr/bin/env bash

process_file()
{
    FILE_PATH=$1
    filename=$(basename "$FILE_PATH" .scad)
    directory=$(dirname "$FILE_PATH")
    echo "Processing $FILE_PATH - $filename"
    rm -rf "${directory}/${filename}.3mf.png"
    rm -rf "${directory}/${filename}.stl.png"
    rm -rf "${directory}/${filename}.3mf"
    rm -rf "${directory}/${filename}.stl"
    openscad --imgsize 1024,1024 -o "${directory}/${filename}.3mf.png" "${directory}/${filename}.scad"
    magick "${directory}/${filename}.3mf.png" -fuzz 15% -transparent white "${directory}/${filename}.3mf.png"
    openscad --imgsize 1024,1024 --render -o "${directory}/${filename}.stl.png" -o "${directory}/${filename}.3mf" -o "${directory}/${filename}.stl" "${directory}/${filename}.scad"
    magick "${directory}/${filename}.stl.png" -fuzz 15% -transparent white "${directory}/${filename}.stl.png"
}

if [ $# -ne 0 ]; then
    if [[ "$@" == "-?" || "$@" == "-h" ]]; then
        echo "$0 - Find all scad files and process them"
        echo "$0 [file ...] [directory ...] - Process files and/or scad files within directories and sub-directories"
        exit 0
    fi
    for var in "$@"
    do
        if [ -d "$var" ]; then
            shopt -s globstar # Enable recursive globbing
            for FILE_PATH in ${var}/*.scad; do
                if [ -f "$FILE_PATH" ]; then
                    if [[ "$FILE_PATH" != "MicrocontrollerBreadboards.scad" ]]; then
                        process_file "$FILE_PATH"
                    fi
                fi
            done
        else
            process_file "$var"
        fi
    done
else
    shopt -s globstar # Enable recursive globbing
    for FILE_PATH in **/*.scad; do
        if [ -f "$FILE_PATH" ]; then
            if [[ "$FILE_PATH" != "MicrocontrollerBreadboards.scad" ]]; then
                process_file "$FILE_PATH"
            fi
        fi
    done
fi

exit 0;
