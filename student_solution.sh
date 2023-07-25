#!/bin/bash

#directory path has to end with /
DIR=$1

#create directories to assign files in
cd ${DIR} &&  mkdir "txt" && cd ..
cd ${DIR} &&  mkdir "pdf" && cd ..
cd ${DIR} &&  mkdir "jpg" && cd ..
cd ${DIR} &&  mkdir "misc" && cd ..

for file in ${DIR}/*;
do

    #Get the file name + Extension
    FullName=${file##*/}

    #Get File Extension only
    Extension=${FullName##*.}
    
    #first if to skip directories
    if [ ! -d "${file}" ];
    then

        #conditional loop to decided what to do with each extension type
        if [ ${Extension} == "txt" ]
        then
            mv ${file} "${DIR}/txt/${FullName}"

        elif [ ${Extension} == "pdf" ]
        then
            mv ${file} "${DIR}/pdf/${FullName}" 

        elif [ ${Extension} == "jpg" ]
        then
            mv ${file} "${DIR}/jpg/${FullName}"

        else
            mv ${file} "${DIR}/misc/${FullName}"
        fi

    fi
done
