# Organize Shell Script

This script, `Organize_Shell.sh`, is designed to help you organize a directory containing various files of different types. It creates separate directories based on the file extensions and moves the corresponding files into their respective directories.

## Usage

1. First, create a new directory named "directory" using the following command:

   ```bash
   mkdir directory
   ```

2. Next, create 50 files of different types (txt, jpg, pdf, and misc) in the "directory" using the `touch` command:

   ```bash
   touch directory/file{1..50}.txt && touch directory/file{1..50}.jpg && touch directory/file{1..50}.pdf && touch directory/file{1..50}
   ```
   ![1](https://github.com/embeddedlinuxworkshop/M1-A2/assets/107740350/233600fe-3228-422d-809b-88802f187e45)
files in terminal :
   ![2](https://github.com/embeddedlinuxworkshop/M1-A2/assets/107740350/2217b378-1134-4c3f-af85-a11ca987a182)


3. Now, run the `Organize_Shell.sh` script and provide the path to the directory as an argument:

   ```bash
   ./Organize_Shell.sh directory/
   ```
    ![3](https://github.com/embeddedlinuxworkshop/M1-A2/assets/107740350/1fda0220-91d6-4dd9-8734-248971aff97a)

4. The script will create new directories within the specified path and organize the files accordingly:

     ![4](https://github.com/embeddedlinuxworkshop/M1-A2/assets/107740350/4f5c3410-1157-418f-b682-ae5156ef57d1)

   - All `.txt` files will be moved to the `directory/txt/` directory.
   - All `.jpg` files will be moved to the `directory/jpg/` directory.
   - All `.pdf` files will be moved to the `directory/pdf/` directory.
   - All other files with no extension (miscellaneous files) will be moved to the `directory/misc/` directory.

    ![5](https://github.com/embeddedlinuxworkshop/M1-A2/assets/107740350/39e1336c-dac8-43c4-859b-e0c05da888ba)


## Script Code

```bash
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

```
