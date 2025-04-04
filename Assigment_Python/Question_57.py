#  Write a Python program to find the highest 3 values in a dictionary

my_dict = {
    'a': 50,
    'b': 20,
    'c': 80,
    'd': 10,
    'e': 60
}

top_3 = sorted(my_dict.values(), reverse=True)[:3]

print("Top 3 highest values:", top_3)
