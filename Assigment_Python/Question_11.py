# Write a Python program to test whether a passed letter is a vowel or not. 


for i in range(1,6):
    char = input("Enter character : ")
    if char in "aeiou":
        print("vowel")
    else:
        print("not a vowel")