#!/bin/bash

mkdir -p /tmp/.cache

TMP_FOLDER=${INPUT_FOLDER}/${v_gid}
mkdir -p ${TMP_FOLDER}


IFS=',' read -r -a array <<< "$v_files" 
cnt=${#array[@]}
for ((i=0;i<cnt;i++)); do
    array[i]="${INPUT_FOLDER}/${array[i]}"
    mv "${array[i]}" ${TMP_FOLDER}/
done

ls -l ${TMP_FOLDER}

(HOME=/tmp python -m mnamer \
--no-style \
--batch \
-v \
--movie-directory="${MOVIES_FOLDER}/{name} ({year})" \
--episode-directory="${TV_SHOWS_FOLDER}/{series}/Season {season:02}" \
${TMP_FOLDER}/ \
| sed 's/\x1b\[[0-9;]*[a-zA-Z]//' 2>&1 || true) > /tmp/log.txt

#Clear useless files
# find ${TMP_FOLDER}/ -type f -name "*.nfo" -delete
# find ${TMP_FOLDER}/ -type f -name "*.txt" -delete
# find ${TMP_FOLDER}/ -type f -name "*.jpg" -delete
# find ${TMP_FOLDER}/ -type f -name "*.png" -delete
