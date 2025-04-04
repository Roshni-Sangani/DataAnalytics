#  Write a Python function to check whether a number is perfect or not.

def perfect_number(n):
    if n <= 0:
        return False
    divisors = [i for i in range(1, n) if n % i == 0]
    return sum(divisors) == n

num = int(input("Enter a number: "))
if perfect_number(num):
    print(f"{num} is a perfect number!")
else:
    print(f"{num} is not a perfect number.")
