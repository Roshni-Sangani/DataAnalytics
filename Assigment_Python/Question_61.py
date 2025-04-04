#  Write a Python function to calculate the factorial of a number (a nonnegative integer) 

def factorial(n):

    if n < 0:
        raise ValueError("Input must be a nonnegative integer.")
    if n == 0 or n == 1:
        return 1
    return n * factorial(n - 1)

user = int(input("Enter a number : "))
print(factorial(user))  
