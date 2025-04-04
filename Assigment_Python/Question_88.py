#  What happens when „1‟== 1 is executed?

"""
When you execute "1" == 1 in Python, it will return False.

Here's why:

"1" is a string containing the character 1.

1 is an integer.

Python does not automatically convert between different types for comparison, so it checks if the types are the same first. Since a string ("1") is not the same type as an integer (1), the comparison will return False.

In short, "1" == 1 evaluates to False because Python sees them as different types (string vs. integer).

"""