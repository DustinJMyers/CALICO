#This file is meant for python3
import os
import sys
import getpass


# Installation Variables
installation_user = 'postgres'
installation_db   = 'postgres'



# Check if we have sudo or postgres capabilities 
runmode = 'regular user'
if (os.geteuid() and getpass.getuser() != installation_user):
    print("Sorry, this script requires sudo rights to access the local DB")
    print("You may also run this script as the " + installation_user + " user")
    print("please try 'sudo python3 Install_SQL.py'")
    exit()
else:
    if getpass.getuser() == installation_user:
        runmode = 'user'
    else:
        runmode = 'sudo'

# Confirm the user knows what this script may result in
print("This script may damage any existing CALICO install.")
print("A new Schema 'CALICO' will be created and populated in ")
print("the postgres database.")
    
confirmation_text = ''
while not confirmation_text.lower() == "install":
    print("Please type 'install' to continue with the setup.")
    try:
        confirmation_text = input("$>")
    except:
        print("\n...Exiting setup")
        exit()
print("Starting Setup:")

# Parse SQL_setup_order.txt and execute .sql files in order
# (sudo -u postgres) psql -d myDataBase -a -f myInsertFile
# Read from text while line by line which .sql to execute inorder
sql_files = [line for line in  open('./SQL_setup_order.txt').read().split('\n') if not line == '' and not line[0] == '#' ]
try:
    command = 'psql -d '+ installation_db + ' -a -f '
    for file in sql_files:
        if runmode == 'user':
            os.system(command + file)
        elif runmode == 'sudo':
            os.system('sudo -u ' + installation_user + ' ' + command + ' ' + file)
except:
    print("There was an issue during installation.")