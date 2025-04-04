#  Write a Python script to sort (ascending and descending) a dictionary by value.

d1 = {'a': 3, 'b': 1, 'c': 2, 'd': 4}

ascending = dict(sorted(d1.items(), key=lambda item: item[1]))
decending = dict(sorted(d1.items(), key=lambda item: item[1], reverse=True))

print(ascending)
print(decending)