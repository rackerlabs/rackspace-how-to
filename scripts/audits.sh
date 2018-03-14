#!/bin/bash

# Purpose: Identify all *md files in H2 repo where the audit date is after date begin date passed in with script call
# and before end date passed in with script call
#
#
#
# Example call: audits.sh 2016-01-29 2016-04-05
#
# NOTE: Script assumes you are executing from within the scripts directory of
#       your local H2 git repo.
#
# Process:
# 1) Get the dates to compare from the arguments passed in
# 2) Go to H2 repo content directory (assumption is you are in the scripts dir)
# 3) Use for loop to go through all *md files in each content sub dir
#    and list all file names and directories where:
#    a) create_date is between begin and end dates (from the script arguments)
#

# assign date arguments to variables
begdate=$1
enddate=$2
echo "date range is between " $begdate " and " $enddate

#set counter
count=0

# Go to content directory and loop through all 'md' files in sub dirs
cd ../content

FILES=`find .  -type f -name '*md' -print`

for f in $FILES
do

# find audit_date in file meta data
   adate=`grep audit_date $f`

# separate actual dates from rest of the grepped line
   aadate=`echo $adate | awk -F\' '{print $2}'`

# if create date is between the begin and end dates passed in - proceed
      if [[ "$aadate" > "$begdate" ]] && [[ "$aadate" < "$enddate" ]] ;
      then

# print out all files with audit dates between specified date range
         echo "Audit date: " $aadate " " $f;
         count=$((count+1));
      fi
done
echo $count " files with audit dates between " $begdate " and " $enddate
