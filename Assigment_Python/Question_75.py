# Write a Python program to read last n lines of a file. 

def read_last_n_lines(file_path, n):
    try:
        with open(file_path, 'r') as file:
            lines = file.readlines()
            last_lines = lines[-n:]
            
            print(f"Last {n} line(s) of the file:")
            for line in last_lines:
                print(line.strip())
    except FileNotFoundError:
        print("Error: File not found.")
    except Exception as e:
        print(f"An error occurred: {e}")

file_path = 'Question_73.txt'  
n = int(input("Enter number of lines to read from the end: "))
read_last_n_lines(file_path, n)
