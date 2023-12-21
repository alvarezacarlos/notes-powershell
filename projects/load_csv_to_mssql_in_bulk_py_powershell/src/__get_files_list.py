import os

def get_files_list():  
  files_path=os.environ.get('NEW_FILES_PATH')
  files_list = os.listdir(files_path)
  return files_list