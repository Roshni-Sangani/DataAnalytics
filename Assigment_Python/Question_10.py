#  Write a Python program to find whether a given number is even or odd, print out an appropriate message to the user.


num = int(input("Enter a number: "))

if num % 2 == 0:
    print(f"{num} is an even number.")
else:
    print(f"{num} is an odd number.")


