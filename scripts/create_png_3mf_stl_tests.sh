#!/usr/bin/env bash

shopt -s globstar # Enable recursive globbing
for FILE_PATH in tests/*.scad; do
    if [ -f "$FILE_PATH" ]; then
        if [[ "$FILE_PATH" != "MicrocontrollerBreadboards.scad" ]]; then
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
            #openscad  --render -o "${directory}/${filename}.stl.png" "${directory}/${filename}.scad"
            #openscad -o "${directory}/${filename}.3mf" "${directory}/${filename}.scad"
            #openscad -o "${directory}/${filename}.stl" "${directory}/${filename}.scad"
        fi
    fi
done



