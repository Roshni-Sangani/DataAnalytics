# What is File function in python? What are keywords to create and write file.

"""
In Python, file functions let you work with files — like creating, reading, writing, and closing them. 
Let’s break it down:

You use the built-in open() function to open or create files. Its syntax is:

file = open("filename.txt", "mode")

File Modes (Keywords)

When using open(), you specify a mode that tells Python what to do with the file:

"r" — Read mode (default). Opens the file for reading. Fails if the file doesn’t exist.

"w" — Write mode. Creates a new file or overwrites an existing file.

with open("example.txt", "w") as file:
    file.write("Hello, world!\n")
    file.write("Another line.")

"""