#  What is tuple? Difference between list and tuple. 

"""
A tuple is an ordered, immutable collection of items in Python. 

Tuples are defined by placing items inside parentheses () and separating them with commas. 

For example:
my_tuple = (1, 'apple', 3.14)


Aspect	                     List	                                               Tuple

Syntax :	    Defined with square brackets [].	                   Defined with parentheses ().

Mutability :	Mutable — can be changed (add, remove, modify).	       Immutable — cannot be changed once created.

Performance :   Slightly slower due to flexibility.             	   Faster due to immutability.

Methods Available :	Many built-in methods (e.g., append(), remove()).	Fewer built-in methods.

Use Case :	    Suitable for dynamic data that changes often.	        Ideal for fixed data that shouldn’t change.

Memory Consumption :	Consumes more memory.	                        Consumes less memory.



Example:

# List
my_list = [1, 2, 3]
my_list.append(4)  #  Allowed

# Tuple
my_tuple = (1, 2, 3)
my_tuple[0] = 100  #  Error: Tuples are immutable

"""