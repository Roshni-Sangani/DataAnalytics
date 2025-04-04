#  Write a Python program to copy the contents of a file to another file.

def copy_file(source_path, destination_path):
    try:
        with open(source_path, 'r') as src_file:
            content = src_file.read()
        
        with open(destination_path, 'w') as dest_file:
            dest_file.write(content)
        
        print(f"File copied successfully from '{source_path}' to '{destination_path}'.")
    except FileNotFoundError:
        print(f"Error: The file '{source_path}' was not found.")
    except Exception as e:
        print(f"An error occurred: {e}")

source = 'Question_82_1.txt'        
destination = 'Question_82_2.txt'   

copy_file(source, destination)
