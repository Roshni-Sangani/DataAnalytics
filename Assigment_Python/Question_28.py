# Differentiate between append () and extend () methods?

"""
In Python, both append() and extend() are methods used to add elements to a list, 
but they behave differently:

append()
Adds a single element to the end of the list.
The element itself is added as-is, whether it’s a single item, another list, or any other object.
Example:

my_list = [1, 2, 3]
my_list.append([4, 5])  # Appends the entire list as one element
print(my_list)  # Output: [1, 2, 3, [4, 5]]

Key takeaway: Adds one item to the list — even if that item is a list, it gets added as a single element.

extend()
Adds multiple elements to the end of the list by iterating over the given iterable (like a list, tuple, or string) and adding each element individually.
Example:

my_list = [1, 2, 3]
my_list.extend([4, 5])  # Adds each item from the list individually
print(my_list)  # Output: [1, 2, 3, 4, 5]
Key takeaway: Unpacks the given iterable and adds its items one by one to the original list.


append()	Single item as-is	my_list.append([4, 5]) → [1, 2, 3, [4, 5]]
extend()	Each element of an iterable individually	my_list.extend([4, 5]) → [1, 2, 3, 4, 5]

"""