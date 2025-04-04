#  Write a Python program to read a file line by line store it into a variable.

file_path = 'Question_73.txt'

lines = []

with open(file_path, 'r') as file:
    lines = file.readlines()


print("Contents of the file stored in variable:")
for line in lines:
    print(line.strip())
