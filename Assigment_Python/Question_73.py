# Write a Python program to append text to a file and display the text. 

file = open("Question_73.txt", "a") 
file.write("This is a new line appended to the file.\n")
file.write("This is a second new line appended to the file.\n")
file.close()

file = open("Question_73.txt", "r")  
print("Contents of the file:")
print(file.read())
file.close()
