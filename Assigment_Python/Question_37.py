#  Write a Python program to convert a list of characters into a string.

def string(char_list):
    result = ""
    for char in char_list:
        result += char  
    return result

char_list = ['P', 'y', 't', 'h', 'o', 'n']
result = string(char_list)
print("Resulting string:", result)