#Write a Python program to get a single string from two given strings, separated by a space and swap the first two characters of each string.

string1 = input("Enter first string: ")
string2 = input("Enter second string: ")

if len(string1) < 2 or len(string2) < 2:
    print("Both strings should have at least two characters.")
else:
    swapped_string1 = string2[:2] + string1[2:]
    swapped_string2 = string1[:2] + string2[2:]
    
    result = swapped_string1 + " " + swapped_string2
    print("Result:", result)
