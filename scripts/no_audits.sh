#!/bin/bash

# Purpose: Identify all *md files in H2 repo where there is no audit date
#
#
#
# Example call: no_audits.sh
#
# If that call doesn't work, try ./no_audits.sh
#
# NOTE: Script assumes you are executing from within the /scripts directory of
#       your local H2 git repo.
#
# Process:
# 1) Go to H2 repo content directory (assumption is you are in the scripts dir)
# 2) Use for loop to go through all *md files in each content sub dir
#    and list all file names and directories where audit date is null,
#    skipping over index.md and /all.md files

#set counter
count=0

# Go to content directory and loop through all 'md' files in sub dirs
cd ../content

FILES=`find .  -type f -name '*md' -print`

for f in $FILES
do
   # filter out index.md and all.md files
   if [[ "$f" == */all.md ]] || [[ "$f" == *index.md ]] || [[ "$f" == */retired-articles/* ]] ;
   then
      # skip file
      continue
   else
   # find audit_date in file metadata
   adate=`grep audit_date $f`

   # separate actual dates from rest of the grepped line
   aadate=`echo $adate | awk -F\' '{print $2}'`

   # if audit date is null - proceed
      if [[ -z "$aadate" ]] ;
      then

         # print a list of all files without audit dates, and add a
         # pipe character delineator for import into a spreadsheet program
         echo "Audit date: " " | " $aadate " " $f ;
         count=$((count+1));
      fi
   fi
done
echo $count " files without audit dates "
