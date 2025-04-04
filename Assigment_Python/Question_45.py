#  Write a Python program to unzip a list of tuples into individual lists.

tuples_list = [(1, 'a'), (2, 'b'), (3, 'c')]

list1, list2 = zip(*tuples_list)

list1 = list(list1)
list2 = list(list2)

print("List 1:", list1)
print("List 2:", list2)