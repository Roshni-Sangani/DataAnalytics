#  Write a Python function that takes a list and returns a new list with unique elements of the first list. 

def unique_elements(lst):
    return list(set(lst))

my_list = [1, 2, 2, 3, 4, 4, 5]
print(unique_elements(my_list))  