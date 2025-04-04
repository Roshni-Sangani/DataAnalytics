#  What is List? How will you reverse a list?

"""
list : list is a collection data type which is contain similar and dis-similar data elements at single location. 

        list which is represent by [] square braces.

        list is a orderable , sequenced , indexable , mutable  (changeble) data type.


Using slicing (quick and easy):
my_list = [1, 2, 3, 4, 5]
reversed_list = my_list[::-1]
print(reversed_list)  # Output: [5, 4, 3, 2, 1]


Using the reverse() method (modifies the original list):
my_list = [1, 2, 3, 4, 5]
my_list.reverse()
print(my_list)  # Output: [5, 4, 3, 2, 1]


Using the reversed() function (returns a reversed iterator):
my_list = [1, 2, 3, 4, 5]
reversed_list = list(reversed(my_list))
print(reversed_list)  # Output: [5, 4, 3, 2, 1]


Using a loop (manual method):
my_list = [1, 2, 3, 4, 5]
reversed_list = []
for item in my_list:
    reversed_list.insert(0, item)
print(reversed_list)  # Output: [5, 4, 3, 2, 1]


Using a swap (in-place without built-in functions):
my_list = [1, 2, 3, 4, 5]
n = len(my_list)
for i in range(n // 2):
    my_list[i], my_list[n - i - 1] = my_list[n - i - 1], my_list[i]
print(my_list)  # Output: [5, 4, 3, 2, 1]
"""