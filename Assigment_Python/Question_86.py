#  Can one block of except statements handle multiple exception? 

"""
yes, a single except block can handle multiple exceptions in Python. You can do this by specifying multiple 
exception types inside a tuple. Here's an example:


try:
    # Code that may raise an exception
    x = int("hello")  # This will raise a ValueError
except (ValueError, TypeError) as e:
    print(f"An error occurred: {e}")
Explanation:
If an exception of type ValueError or TypeError occurs, the except block will catch it.

The exception instance (e) provides information about the error.

This approach is useful when you want to handle multiple exception types in the same way. 

If you need different handling for different exceptions, you should use separate except blocks.
"""