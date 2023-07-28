#!/bin/bash

ENTEREDPATH=$1
for f in ${ENTEREDPATH}/* ;do
    #skip directories
    if [  ! -f ${f} ] ;then 
        continue
    else
        #ectract the extensions
        EXTENSION="${f##*.}"
        #in case the file has no ectension the EXTENSION variable store the 
        #directory of the file so checking the length it will be known that the file is unknown
    if [ ${#EXTENSION} -gt 7 ]; then
            mkdir -p ${ENTEREDPATH}/WITHOUT
            mv ${f} ${ENTEREDPATH}/WITHOUT
        else
            mkdir -p ${ENTEREDPATH}"/"${EXTENSION}
            mv ${f} ${ENTEREDPATH}"/"${EXTENSION}
        fi
    fi
done


