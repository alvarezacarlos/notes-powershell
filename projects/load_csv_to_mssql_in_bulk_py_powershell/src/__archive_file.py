import shutil
import os

def archive_file(file_url, file_name):
  archived_file_path = os.environ.get('ARCHIVED_FILES_PATH')
  shutil.move(file_url,f"{archived_file_path}\{file_name}")