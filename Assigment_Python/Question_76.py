# Write a Python program to read a file line by line and store it into a list 

def read_file_to_list(filename):
    lines_list = []
    try:
        with open(filename, 'r') as file:
            lines_list = file.readlines()
            lines_list = [line.strip() for line in lines_list]
    except FileNotFoundError:
        print(f"The file '{filename}' was not found.")
    return lines_list

filename = 'Question_73.txt'  
lines = read_file_to_list(filename)

for i, line in enumerate(lines, start=1):
    print(f"Line {i}: {line}")
