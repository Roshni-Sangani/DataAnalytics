#  When will the else part of try-except-else be executed?

"""
In Python, the else part of a try-except-else block will be executed only if no exceptions are raised 
in the try block.

Here's how it works:

The try block executes first.

If an exception occurs in the try block, the except block catches it, and the else block is skipped.

If no exception occurs, the else block is executed.

Example:

try:
    x = 10 / 2  # No exception occurs
except ZeroDivisionError:
    print("Cannot divide by zero!")
else:
    print("Division was successful!")


"""