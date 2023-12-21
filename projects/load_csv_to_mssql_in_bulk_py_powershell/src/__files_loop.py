import subprocess
import sys
import os
import time
from dotenv import load_dotenv


from .__get_files_list import get_files_list
from .__create_sql_table import create_sql_table
from .__archive_file import archive_file
from .__getdb import get_db
    

def files_loop():   
    
    load_dotenv() # load variables from .env into os.environ 

    db_conn, c = get_db() #get db connection

    files_list = get_files_list() # get files list

    # credentials for PowerShell
    server_name=os.environ.get('SERVER_NAME')
    database_name=os.environ.get('DATABASE_NAME')    

    # iterate csv files list and load its data into SQL
    for index, file_name in enumerate(files_list):                

        # prepare csv file_url       
        files_path = os.environ.get('NEW_FILES_PATH')
        file_url = f"{files_path}/{file_name}"
        # print(file_url)

        # create table to store the file data
        create_sql_table(file_name)        
        print(f'Table created for file#: {index} fileName: {file_name}')
        
        try:          
            # make use of power shell script to load sql bulk data into sql
            print('Importing data with powershell script...')
            powershell_path = os.environ.get('POWERSHELL_PATH')
            p = subprocess.Popen(['powershell.exe', f'{powershell_path} "{server_name}" "{database_name}" "[{file_name}]" "{file_url}"'])
            p.communicate()           
        except:                        
            print('Error when trying to call PowerShell Script')       

        # archive file
        archive_file(file_url, file_name)
        print(f'filed "{file_name}" has been archived...')       
            
    c.close()
    db_conn.close()
