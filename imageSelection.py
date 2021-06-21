#Python code to iterate through multiple sub directories and 
#select X amount of random images and put them in new folder
import os 
import random 
import shutil

files_list = []

for root, dirs, files in os.walk("/Volumes/Untitled/Internet Research Agency"): 
	for file in files:
#all
    if file.endswith(".jpg") or file.endswith(".png") or file.endswith(".jpeg"):
      files_list.append(os.path.join(root, file))

#print images
#lets me count and print the amount of jpeg,jpg,pmg 
file_count = len(files_list)
print file_count

# print files_list
filesToCopy = random.sample(files_list, X) #prints X random imagesfrom list

destPath = "slideProj"

# if destination dir does not exists, create it if os.path.isdir(destPath) == False:
os.makedirs(destPath)

# iteraate over all random files and move them for file in filesToCopy:
shutil.copy(file, destPath)
