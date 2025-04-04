#  Write a Python program to count the number of lines in a text file.

def count_lines_in_file(filename):
    try:
        with open(filename, 'r') as file:
            line_count = sum(1 for _ in file)
        print(f"The file '{filename}' has {line_count} lines.")
    except FileNotFoundError:
        print(f"Error: The file '{filename}' was not found.")
    except Exception as e:
        print(f"An error occurred: {e}")

file_name = input("Enter the filename: ")
count_lines_in_file(file_name)
