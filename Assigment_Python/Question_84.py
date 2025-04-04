# How many except statements can a try-except block have? Name Some built-in exception classes: 

"""

Number of except Statements in a try-except Block
A try-except block can have multiple except statements, each handling a different type of exception. 
However, only one except block is executed per exception occurrence.

Example:

try:
    x = int("hello")  # Raises ValueError
except ValueError:
    print("Caught a ValueError!")
except TypeError:
    print("Caught a TypeError!")
except Exception as e:  # Catches any other exceptions
    print(f"Caught an exception: {e}")

    
Some Built-in Exception Classes in Python:

Python provides several built-in exception classes, including:

BaseException – The root of all exceptions.

Exception – The base class for most built-in exceptions.

ArithmeticError – Base class for errors in arithmetic operations.

    ZeroDivisionError – Division by zero.

    OverflowError – Numerical result too large.

LookupError – Base class for index/key errors.

    IndexError – Invalid index in a sequence.

    KeyError – Invalid dictionary key.

TypeError – Operation applied to an object of the wrong type.

ValueError – Incorrect value passed to a function.

FileNotFoundError – Raised when a file operation fails because the file does not exist.

IOError – Raised for input/output operations failure.

NameError – A variable is not defined.

ImportError – Raised when an import fails.

AssertionError – Raised when an assert statement fails.
"""