import os
import xlsxwriter



# Loop through each file in the folder
# set the audit_date variable
# DO THIS WITHIN THE LOOP (INDEPENDENTLY FOR EACH FILE), MAYBE BY EXTRACTING
# THE DATA CHARACTERS VIA THEIR INDEXES WITHIN THE CONTENT STRING FOR THE FILE
# CONTENT

    # Create a new variable and assign it the value of the 3rd list item in "lines", SLICEd TO GET CHARS at index 13 - 22 only)
    # convert this new variable to date format
    # audit_date =
# NEED TO CONVERT THE STRING VALUE TO A DATE
# Compare the audit_date to the start_date and end_date entered by the
# info dev
    # if audit_date is NOT between start_date and end_date, continue
    # else, print to excel file
# print final message

# create the loop to loop through the files in the folder
def filter_files(dir, start_date, end_date):
    r = []
    count = 0
    for root, dirs, files in os.walk(dir):
        for file in files:
            path = root + "/" + file
            if "all.md" in path or "index.md" in path or "retired-" in path:
                continue
            else:
                text = open(path,'r+')
                lines = text.readlines()
                audit_date = lines[2]
                print(audit_date)
