import os
import datetime
import xlsxwriter

# Create a workbook and add a worksheet.
workbook = xlsxwriter.Workbook('../files/h2-audits.xlsx')
worksheet = workbook.add_worksheet()

info = ([])
dir = "../content/"

def filter_files():
    start_date = str(input("Begin date (use format YYYY-MM-DD): "))
    end_date = str(input("End date (use format YYYY-MM-DD): "))
    r = []
    count = 0
    try:
        # convert the string arguments to date format
        begin_date = datetime.datetime.strptime(start_date, '%Y-%m-%d').date()
        stop_date = datetime.datetime.strptime(end_date, '%Y-%m-%d').date()
    except ValueError:
        print("You didn't follow the right format.")
    # Loop through each file in the folder
    for root, dirs, files in os.walk(dir):
        for file in files:
            # construct the path for each file
            path = root + "/" + file
            # skip files that aren't relevant
            if "all.md" in path or "index.md" in path or "retired-" in path or "DS_Store" in path or len(path) < 11:
                continue
            else:
                #open the file and read the content
                text = open(path,'r+')
                lines = text.readlines()
                # skip files that don't have at least 3 lines
                if len(lines) < 2:
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
                            # Slice audit_date_list to get chars at indexes
                            # 13-22
                            # only, then join those chars
                            audit_date_slice = "".join(audit_date_list[13:23])
                            #convert audit_date_slice to date format
                            audit_date_final = datetime.datetime.strptime(audit_date_slice, '%Y-%m-%d').date()
                        # if the index value is out of range, print the name
                        # of the offending file to get more info & correct
                        # the issue
                        except ValueError:
                            print("There's a problem with the audit date "
                            " in the file at " + path)
                        # if the file's audit date is between the dates
                        # provided by the info dev, print the results
                        if audit_date_final >= begin_date and audit_date_final <= stop_date:
                            # Create the link
                            # First, convert the file name to a list and strip the .md
                            # file extension from it
                            file = list(file)
                            del file[-1:-4:-1]
                            # Then, join the list items back together
                            file = "".join(file)

                            # Compose the link for each file
                            link = "https://support.rackspace.com/how-to/" + file + "/"
                            # Append the file name and link to "info"
                            info.append([audit_date_slice, path, link])
                            # Increment the counter
                            count += 1
                        else:
                            continue
    # Write file and link to a spreadsheet
    # Start from the second cell. Rows and columns are zero
    # indexed.
    row = 0
    col = 0
    # write file and link
    try:
         # Loop through the items inside the "info" *list of lists*
         for grouping in (info):
             worksheet.write(row, col, info[row][0])
             worksheet.write(row, col + 1, info[row][1])
             worksheet.write(row, col + 2, info[row][2])
             row += 1
    except:
         print("An export problem occurred.")
    # print a success message
    print("\nSuccess! There are {} How-To articles that fit your criteria. \n \n"
    "YOUR RESULTS HAVE BEEN SAVED TO ..FILES/H2-AUDITS.XLSX. \n \n"
    "To make this information editable for all Info Devs, copy and paste the "
    "content into a new Excel file in O365 online and share it, then \n"
    "** delete the local file at ../files/h2-audits.xlsx **.\n"
    "\n".format(count))

# call the function
filter_files()
workbook.close()
