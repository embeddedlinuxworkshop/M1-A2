#!/bin/bash

DIR_PATH=""

GetPath()
{
	read -p "Enter the path: " DIR_PATH	
}

MK_DIRS()
{
	cd ${DIR_PATH}
	
	DIRS=( "txt" "jpg" "pdf" "misc" )
	
	# if the directory not found create it #
	for DIR in "${DIRS[@]}" ; do
	
		if [[ ! -d "$DIR" ]] ; then
			mkdir "$DIR"
		fi
		
	done
}

OrganizeFiles()
{
	for file in "$DIR_PATH"/* ; do
		
		# if the file is a directory skip it #
		if [[ -d "$file" ]] ; then
			continue
		fi 
		
		if [[ "$file" == *.txt ]] ; then
			mv "$file" "$DIR_PATH"/txt
			
		elif [[ "$file" == *.jpg ]] ; then
			mv "$file" "$DIR_PATH"/jpg
			
		elif [[ "$file" == *.pdf ]] ; then
			mv "$file" "$DIR_PATH"/pdf
		
		else
			mv "$file" "$DIR_PATH"/misc
		fi
		
	done
}

LS_DIRS()
{

	ls $DIR_PATH $DIR_PATH/txt $DIR_PATH/pdf $DIR_PATH/jpg $DIR_PATH/misc
	
}

GetPath $DIR_PATH

MK_DIRS $DIR_PATH

OrganizeFiles $DIR_PATH

LS_DIRS $DIR_PATH











