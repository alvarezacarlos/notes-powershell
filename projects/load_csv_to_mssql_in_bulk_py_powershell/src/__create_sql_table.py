import os
import codecs
import csv

import sys
import shutil
import pyodbc

from .__getdb import get_db


def create_sql_table(file_name):    
    
    db, c = get_db()
    
    files_path = os.environ.get('NEW_FILES_PATH')
    file_path = f'{files_path}\{file_name}'  

    with codecs.open(file_path, encoding="utf8", errors='replace') as csvfile:        
      csvreader = csv.reader(csvfile, delimiter='|')
      fields =  next(csvreader)      
      table_columns = "],[".join([str(i).replace(' ', '_').replace('#', 'Number')  for i in fields])      
      
      table_columns_definition = []
      for column in fields:
        table_columns_definition.append('[' + str(column).replace(' ', '_').replace('#', 'Number') + '] varchar(max)')                       
      
      table_columns_definition.append(f"ID INT NOT NULL PRIMARY KEY IDENTITY")
      table_columns_definition.append(f"ImportedDate datetime DEFAULT GETDATE()")

      # drop table if exists
      drop_query= f"""drop table if exists [{file_name}]"""
      c.execute(drop_query)
      db.commit()      
                
      # create table query
      create_table_query = f""" CREATE TABLE [{file_name}] ({table_columns_definition}) """      
      create_table_query = create_table_query.replace('([', '(').replace('])', ')').replace("'", '')     
      create_table_query = f"{str(create_table_query).strip()[:-1]} , [SourceName] varchar(max) DEFAULT CONVERT(VARCHAR(MAX), '{file_name}'))"
      # print(create_table_query)

      # Hit DB to create the data table
      try:
        c.execute(create_table_query)            
        db.commit()          
        # print(f'Table {file_name} Created')
      except Exception as e:
        print(f'Error Message (CREATE STMT) ==>> {e}')

          
    #   print('Importing data to SQL.....')
    #   for row in csvreader:          
    #       insert_query = "INSERT INTO ["+ file_name +"] (["+ table_columns +"]) VALUES ("+ "?, "*(len(row)-1) + "?)"
    #       try:                             
    #           c.execute(insert_query, tuple(row))
    #           db.commit()  
    #       except Exception as e:
    #           print(f"Error at Row: {row[0]}") 
    #           print(f'Error Message (INSERT STMT) ==>> {e}')     
    
    #   print('Sheet {0} Data Loaded to SQL [{1}] Table.'.format(file_name, file_name))