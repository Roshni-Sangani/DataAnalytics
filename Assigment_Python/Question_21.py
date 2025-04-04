# Write a Python program to add 'in' at the end of a given string (length should be at least 3). If the given string already ends with 'ing' then add 'ly' instead if the string length of the given string is less than 3, leave it unchanged. 


string = input("Enter the string : ")

if len(string) >= 3 and string[-3:] == "ing":
    print(string.replace("ing","ly"))
elif len(string) >= 3:
    print(string + "ing")
else:
    print(string)