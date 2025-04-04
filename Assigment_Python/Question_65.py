#  How Many Basic Types of Functions Are Available in Python?

"""
In Python, there are four basic types of functions:

Built-in Functions:
These are functions that come pre-defined with Python. Examples include:

print()
len()
type()
input()

User-defined Functions:
These are functions that you create yourself to perform specific tasks. Example:

def greet(name):
    return f"Hello, {name}!"

Lambda (Anonymous) Functions:
These are small, single-expression functions that don’t require a name. Example:

square = lambda x: x ** 2

Recursive Functions:
These are functions that call themselves to solve problems recursively. Example:

def factorial(n):
    if n == 0:
        return 1
    return n * factorial(n - 1)

"""