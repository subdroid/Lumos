#!/usr/bin/env bash

source ~/personal_work_troja/virt/bin/activate
python3 create_pattern_string.py


for folder in len_10_20 len_20_30 len_30_40 len_40_50 len_50_60
do
    trg_folder=$folder/READ
    if [ -d $trg_folder ] ; then
        rm -rf trg_folder
    fi
    mkdir -p $folder/READ
    for d in $folder/* ; do
        if [ -f "$d" ] ; then
            b_name=$(basename $d)
            cat $d > $trg_folder/$b_name".trg"
            sed -e "s/^/<READ> | /" $d > $trg_folder/$b_name".src"
        fi
    done
done

for folder in len_10_20 len_20_30 len_30_40 len_40_50 len_50_60
do
    trg_folder=$folder/REVERSE
    if [ -d $trg_folder ] ; then
        rm -rf trg_folder
    fi
    mkdir -p $folder/REVERSE
    for d in $folder/* ; do
        if [ -f "$d" ] ; then
            b_name=$(basename $d)
            cat $d | rev > $trg_folder/$b_name".trg"
            sed -e "s/^/<REVERSE> | /" $d > $trg_folder/$b_name".src"
        fi
    done
done

for folder in len_10_20 len_20_30 len_30_40 len_40_50 len_50_60
do
    trg_folder=$folder/PREPEND
    if [ -d $trg_folder ] ; then
        rm -rf trg_folder
    fi
    mkdir -p $folder/PREPEND
    for d in $folder/* ; do
        if [ -f "$d" ] ; then
            b_name=$(basename $d)
            sed -e "s/^/X /" $d > $trg_folder/$b_name".trg"
            sed -e "s/^/<PREPEND> | /" $d > $trg_folder/$b_name".src"
        fi
    done
done

for folder in len_10_20 len_20_30 len_30_40 len_40_50 len_50_60
do
    trg_folder=$folder/APPEND
    if [ -d $trg_folder ] ; then
        rm -rf trg_folder
    fi
    mkdir -p $folder/APPEND
    for d in $folder/* ; do
        if [ -f "$d" ] ; then
            b_name=$(basename $d)
            # sed -i 's/$/ 'X'/g' $d > $trg_folder/$b_name".trg"
            cat $d | awk '{print $0" X"}'> $trg_folder/$b_name".trg"
            # sed -e 's/$/ X/' -i $d > $trg_folder/$b_name".trg"
            sed -e "s/^/<APPEND> | /" $d > $trg_folder/$b_name".src"
        fi
    done
done