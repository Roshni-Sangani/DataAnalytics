# Write a Python program to create a dictionary from a string. 
# Note: Track the count of the letters from the string. 

def string_to_dict(s):
    letter_count = {}
    for char in s:
        if char.isalpha(): 
            char = char.lower()
            letter_count[char] = letter_count.get(char, 0) + 1
    return letter_count

input_string = input("Enter a string: ")
result = string_to_dict(input_string)
print("Letter count:", result)
