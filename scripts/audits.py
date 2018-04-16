import os
import arrow
import datetime
import xlsxwriter

# --------------------------------------
    # convert audit_date to date format
    # audit_date =

# --------------------------------------


# Loop through each file in the folder
def filter_files(dir, start_date, end_date):
    r = []
    count = 0
    for root, dirs, files in os.walk(dir):
        for file in files:
            path = root + "/" + file
            if "all.md" in path or "index.md" in path or "retired-" in path or "DS_Store" in path or len(path) < 11:
                continue
            else:
                text = open(path,'r+')
                lines = text.readlines()
                if len(lines) < 3:
                    continue
                else:
                    # set the audit_date variable (the 3rd list item in
                    # "lines")
                    audit_date = lines[2]
                    # if the line at index 2 isn't a date, skip
                    if len(audit_date) < 13 or "-" not in audit_date:
                        continue
                    else:
                        try:
                            #convert the audit_date to a list so it can be
                            # sliced
                            audit_date_list = list(audit_date)
                            # Slice audit_date to get chars at indexes 13 - 22
                            # only, then join those chars
                            audit_date_slice = "".join(audit_date[13:23])
                            #convert audit_date_slice to date format
                            # audit_date_slice =
                            # datetime.datetime.strptime(audit_date_slice,
                            # '%y-%m-%d').date()
                            audit_date_slice = arrow.get(audit_date_slice, 'DMYYYY').date()
                            print(isinstance(a, datetime.date))
                            print(audit_date_slice)
                        # if the index value is out of range, print the name
                        # of the offending file to get more info & correct
                        # the issue
                        except IndexError:
                            print(path)



# print final message

# call the function
filter_files("../content/", "2017-05-16", "2018-05-16")
