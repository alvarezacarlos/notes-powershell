import os
import pyodbc

def get_db():

  driver=os.environ.get('DRIVER')
  server_name=os.environ.get('SERVER_NAME')
  database_name=os.environ.get('DATABASE_NAME')
  user_name=os.environ.get('USER_NAME')
  user_password=os.environ.get('USER_PASSWORD')  

  conn_string = f"Driver={driver};Server={server_name};Database={database_name};UID={user_name};PWD={user_password};"

  db = pyodbc.connect(conn_string)
  c = db.cursor()

  return db, c