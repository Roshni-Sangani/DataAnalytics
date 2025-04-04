# Write a Python program to map two lists into a dictionary 
# Sample output: Counter ({'a': 400, 'b': 400,’d’: 400, 'c': 300}).


keys = ['a', 'b', 'c', 'd']
values = [400, 400, 300, 400]

result = {k: v for k, v in zip(keys, values)}

print("Mapped Dictionary:", result)