#  Write a Python script to check if a given key already exists in a dictionary. 

def key(my_dict, key):
    if key in my_dict:
        print(f"Key '{key}' exists in the dictionary.")
    else:
        print(f"Key '{key}' does not exist in the dictionary.")

my_dict = {'name': 'Alice', 'age': 30, 'city': 'New York'}
key_to_check = 'age'

key(my_dict, key_to_check)
