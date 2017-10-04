#!/bin/bash

# Purpose: Identify all *md files in H2 repo where:
# Last modified date is after date begin date passed in with script call
# and before end date passed in with script call
#
# Example call: lastupdate.sh 2016-01-29 2016-04-05
#
# NOTE: Script assumes you are executing from within the scripts directory of
#       your local H2 git repo.
#
# Process:
# 1) Get the dates to compare from the arguments passed in
# 2) Go to H2 repo content directory (assumption is you are in the scripts dir)
# 3) Use for loop to go through all *md files in each content sub dir
#    and list all file names and directories where:
#       last_modified_date is between begin and end dates (from the script arguments)
#
# Updates:
#


# assign date arguments to variables
begdate=$1
enddate=$2
echo "date range is between " $begdate " and " $enddate

#set counter
count=0

# Go to content directory and loop through all 'md' filesi in sub dirs
cd ../content

FILES=`find .  -type f -name '*md' -print`

for f in $FILES
do

# find last_modified_date and last_modified_date in file meta data
   cdate=`grep last_modified_date $f`
   mdate=`grep last_modified_date $f`
# separate actual dates from rest of the grepped line
   acdate=`echo $cdate | awk -F\' '{print $2}'`
   amdate=`echo $mdate | awk -F\' '{print $2}'`

# if last_modified_date is between the begin and end dates passed in - proceed
  if [[ "$acdate" > "$begdate" ]] && [[ "$acdate" < "$enddate" ]] ;
  then
# print out all modifed files
     echo "File last modified: " $acdate " " $f;
     count=$((count+1));
  fi
done
echo $count " Files modified between " $begdate " and " $enddate
