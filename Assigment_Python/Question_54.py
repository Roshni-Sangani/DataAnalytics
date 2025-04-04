#  Write a Python program to check multiple keys exists in a dictionary

def check_keys_exist(dictionary, keys):
    return all(key in dictionary for key in keys)

my_dict = {'name': 'Alice', 'age': 30, 'city': 'New York'}
keys_to_check = ['name', 'age','money']

if check_keys_exist(my_dict, keys_to_check):
    print("All keys exist!")
else:
    print("Some keys are missing.")
