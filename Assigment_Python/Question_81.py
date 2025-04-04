#  Write a Python program to write a list to a file. 

my_list = ['apple', 'banana', 'cherry', 'date']

file_name = 'Question_81.txt'

with open(file_name, 'w') as file:
    for item in my_list:
        file.write(f"{item}\n")

print(f"List has been written to {file_name}")
