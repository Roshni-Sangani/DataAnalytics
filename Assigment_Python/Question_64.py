#  Write a Python function that checks whether a passed string is palindrome or not 

def func():
    num = int(input("Enter a number : "))

    return str(num) == str(num)[::-1]

print(func())