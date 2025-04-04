#  Write a Python program to create a tuple with different data types.

my_tuple = (42, 3.14, "roshni", True, None, [1, 2, 3], {'key': 'value'}, (10, 20))

print("The created tuple is:", my_tuple)

print("\nTypes of each element in the tuple:")
for element in my_tuple:
    print(f"{element}: {type(element)}")
