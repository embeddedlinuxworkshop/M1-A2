#!/bin/bash

FILE_PATH="$1"

mkdir -p "$FILE_PATH/txt" "$FILE_PATH/jpg" "$FILE_PATH/pdf" "$FILE_PATH/misc"

for file in "$FILE_PATH"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        extension="${filename##*.}"

        case "$extension" in
            "txt")
                echo "It's a txt file."
                mv "$file" "$FILE_PATH/txt/"
                ;;
            "jpg")
                echo "It's a jpg."
                mv "$file" "$FILE_PATH/jpg/"
                ;;
            "pdf")
                echo "It's a pdf."
                mv "$file" "$FILE_PATH/pdf/"
                ;;
            *)
                echo "Unknown misc."
                mv "$file" "$FILE_PATH/misc/"
                ;;
        esac
    fi
done

