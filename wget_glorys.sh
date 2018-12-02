#!/bin/bash 
# 
# Script used to dowload glorys data from THREDDS
# 
# ex: sh ./wget_glorys.sh gridT 1993 2015
# 
#
# - Frederic.Cyr@dfo-mpo.gc.ca, Jan. 2018
# ----------------------------------------------------------------------------------- #


if [ $# -ne 3 ]
then 
    echo usage ex:
    echo ./wget_glorys gridT 1993 2015
    exit 1
fi

# replace input
var=$1
year1=$2
year2=$3

for yyyy in $(seq $year1 $year2)
do
    for mm in $(seq 1 12)
    do
    
	if [ $mm -lt 10 ]
	then
	    mm=0$mm
	fi
    
	# URL example:
	# http://navigator.oceansdata.ca/thredds/fileServer/glorys/v4/MONTHLY_2015/GLORYS2V4_ORCA025_201512_gridT.nc
	
	URL="http://navigator.oceansdata.ca/thredds/fileServer/glorys/v4/MONTHLY_${yyyy}/GLORYS2V4_ORCA025_${yyyy}${mm}_${var}.nc"
	wget $URL
 
    done
done
