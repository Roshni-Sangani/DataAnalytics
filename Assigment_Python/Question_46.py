# Write a Python program to convert a list of tuples into a dictionary.

def convert_to_dict(tuples_list):
    return dict(tuples_list)

tuples_list = [(1, 'apple'), (2, 'banana'), (3, 'cherry')]
result = convert_to_dict(tuples_list)

print("Converted Dictionary:", result)