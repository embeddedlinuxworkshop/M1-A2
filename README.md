# M1-A2
Assignment number 2 in M1



**Project Idea: File Organizer**

The goal of this project is to create a Bash script that organizes files in a specified directory based on their file types into separate subdirectories. This can be useful to keep your directories clean and tidy by automatically sorting files into appropriate categories.

**Features:**

- The script should take a directory path as an argument and organize the files within that directory.
- It should create subdirectories based on the file extensions (e.g., "txt" for text files, "jpg" for image files).
- Files with unknown or no file extensions should be placed in a "misc" subdirectory.
- If a subdirectory for a particular file type already exists, the script should move the files into that existing directory.
- The script should handle edge cases, such as files with no extensions or hidden files (those starting with a dot).

**Example:** Suppose you have a directory called "Downloads" with the following files:

```shell
file1.txt
file2.jpg
file3.pdf
file5_without_extension
file6.unknown
```

## output:

```shell
Downloads/
|-- txt/
|   |-- file1.txt
|-- jpg/
|   |-- file2.jpg
|-- pdf/
|   |-- file3.pdf
|-- misc/
|   |-- file5_without_extension
|   |-- file6.unknown
```

************************************************************************************************************************************************************

## **Let's take about the algorithm:**

we can divide the algorithm of the script into 4 parts:
1-Geting the path of the directory we wnat to organize.
2-Creating the sub-directories to organize the files and put them inside the sub-directories.
3-Organize the files and put them inside the sub-directories.
4-List the sub-directories and the files as a way of verfication to make sure that the algorithm is working as required.

To-do that, I create four functions for each part:
1-GetPath 
2-MK_DIRS 
3-OrganizeFiles 
4-LS_DIRS




