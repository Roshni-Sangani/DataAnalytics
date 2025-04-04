#  How Do You Handle Exceptions with Try/Except/Finally in Python? Explain with coding snippets. 

"""
In Python, the try, except, and finally blocks are used to handle exceptions in a structured way. These blocks allow you to write code that can catch and handle errors, and ensure that some code runs regardless of whether an exception was raised or not.

Here’s a breakdown of each block:

try block: This is where you put the code that might cause an exception.

except block: This is where you handle the exception if one occurs.

finally block: This block will always execute, whether or not an exception was raised.

It's typically used for cleanup code (like closing files or releasing resources).

Example 1: Basic Try/Except

try:
    x = 10 / 0  # This will raise a ZeroDivisionError
except ZeroDivisionError:
    print("You can't divide by zero!")
In this case, the ZeroDivisionError is raised in the try block, and the except block catches it, printing the error message.

Example 2: Handling Multiple Exceptions
You can handle multiple exceptions by specifying different except blocks for each one:

try:
    x = int(input("Enter a number: "))  # User input might cause a ValueError
    result = 10 / x  # Division by zero could happen
except ValueError:
    print("That's not a valid number!")
except ZeroDivisionError:
    print("You can't divide by zero!")
Here, we are catching both ValueError (in case the user enters a non-integer value) and ZeroDivisionError (if the user enters zero).

Example 3: Using Finally
The finally block will always execute, even if no exception is raised. It’s useful for cleanup tasks like closing files or network connections:

try:
    file = open("example.txt", "r")
    content = file.read()
    print(content)
except FileNotFoundError:
    print("File not found!")
finally:
    file.close()  # Ensures the file is closed whether or not there was an error
    print("File is closed.")
In this example, even if there’s an exception (like FileNotFoundError), the finally block will execute, ensuring the file is closed properly.

Example 4: Catching All Exceptions
You can catch all exceptions using a generic except block. However, it's not recommended unless you really need to catch everything (because you might miss handling specific exceptions):

try:
    x = int(input("Enter a number: "))
    result = 10 / x
except Exception as e:
    print(f"An error occurred: {e}")
This catches any exception that might be raised and prints a message about it.

Example 5: Else Clause
The else block can be used if no exceptions are raised in the try block. It runs after the try block if everything works fine:

try:
    x = int(input("Enter a number: "))
    result = 10 / x
except ZeroDivisionError:
    print("You can't divide by zero!")
else:
    print(f"The result is {result}")
finally:
    print("Execution complete.")
Here, the else block will run if no exception occurs during the try block.

Summary of Flow:
The try block runs first.

If an exception occurs, the corresponding except block runs.

The finally block runs after the try and except, regardless of whether an exception occurred or not.

The else block runs if no exception occurs.

These blocks allow for graceful handling of exceptions and help ensure that the program doesn't crash unexpectedly.

"""