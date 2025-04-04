#  Write a Python program to find the second smallest number in a list.

numbers = [4, 1, 7, 1, 3, 4, 2]

unique_numbers = sorted(set(numbers))
result = unique_numbers[1] if len(unique_numbers) > 1 else None

print("Second smallest number:", result)