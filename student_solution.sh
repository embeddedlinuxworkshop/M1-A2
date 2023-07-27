#!/bin/bash


GetExtension() {
    filename="$1"
    extension="${filename##*.}"
    if [ "$extension" = "$filename" ]; then
        extension=""
    fi
    echo "$extension"
}

Organize() {
    dir="$1"
    misc_dir="${dir}/misc"
    mkdir -p "$misc_dir"


    for file in "${dir}"/*; do
        if [ -f "$file" ]; then
            filename=$(basename "$file")
            extension=$(GetExtension "$filename")
            
            if [[ "$filename" == .* ]]; then
                continue
            fi

            if [ -z "$extension" ]; then
                mv "$file" "$misc_dir/"
            else
                mkdir -p "${dir}/${extension}"
                
                if [ -d "${dir}/${extension}" ]; then
                    mv "$file" "${dir}/${extension}/"
                fi
            fi
        fi
    done

    echo "Files organized successfully."
}

if [ -z "$1" ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi

Organize "$1"

