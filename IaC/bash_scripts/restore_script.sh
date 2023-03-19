#!/bin/bash
function total_files {
    find "$1" -type f | wc -l
}

function total_directories {
    find "$1" -type d | wc -l
}

if [[ -z $1 ]]; then
    echo "Please supply the script with an input file!"
    exit 1
elif [[ -z $2 ]]; then
    echo "Please supply the script with an output directory!"
    exit 1
fi

input_file=$1
output_folder=$2

tar –xvzf "$input_file" "$output_folder"
unpacked_files=$( total_files "$output_folder" )
unpacked_directories=$( total_directories "$output_folder" )

echo "########## $input_file ##########"
echo "Files restored: $unpacked_files"
echo "Directories restored: $unpacked_directories"

(( all=unpacked_files+unpacked_directories ))
echo "TOTAL FILES AND DIRECTORIES: $all"