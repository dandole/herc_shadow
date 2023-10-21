#!/bin/bash

DASD_DEVICES=("2305" "2311" "2314" "3330" "3340" "3350" "3375" "3380" "3390" "9345")

usage() {
    echo "Usage: $0 cnf_file [shadow_folder] [shadow_file]"
    echo "  shadow_folder (default \"shadow\")"
    echo "  shadow_file (default \"_x\")"
    echo "Examples:"
    echo -e "\tdude@hercmain:~/mvs/conf$ $0 local.cnf"
    echo -e "\tWould convert this dasd entry from:"
    echo -e "\t0190    3390    DASD/pub001.3390 cu=3880"
    echo -e "\tto:"
    echo -e "\t0190    3390    DASD/pub001.3390 cu=3880   sf=DASD/shadow/pub001_x.3390\n"
    echo -e "\tdude@hercmain:~/mvs/conf$ $0 local.cnf ShAdOw _sHaDoW_x"
    echo -e "\tWould convert this dasd entry from:"
    echo -e "\t0190    3390    DASD/pub001.3390"
    echo -e "\tto:"
    echo -e "\t0190    3390    DASD/pub001.3390   sf=DASD/ShAdOw/pub001_sHaDoW_x.3390\n"
}

shadow_the_file() {
    local file="$1"
    local shadow_folder="${2:-shadow}"
    local shadow_file="${3:-_x}"

    if [ ! -f "$file" ]; then
        echo "File not found: $file"
        return 1
    fi

    local tmp_file=$(mktemp)
    
    while IFS= read -r line; do
        local parts=($line)
        if [[ ! $line =~ ^# && ${#parts[@]} -gt 2 && ${DASD_DEVICES[*]} =~ ${parts[1]} && $line != *sf=* ]]; then
            local dasd_path_file=${parts[2]}
            local shadow_path="${dasd_path_file%/*}/$shadow_folder/"
            local dasd_file=${dasd_path_file##*/}
            local shadow_line="${dasd_file%.*}$shadow_file.${dasd_file##*.}"
            local shadow="sf=$shadow_path$shadow_line"
            local new_line="$line   $shadow"
            echo "$new_line" >> "$tmp_file"
        else
            echo "$line" >> "$tmp_file"
        fi
    done < "$file"

    mv "$file" "$file.bak"
    mv "$tmp_file" "$file"
}

if [ $# -eq 0 ] || [ $# -gt 3 ]; then
    usage
else
    shadow_the_file "$1" "$2" "$3"
fi
