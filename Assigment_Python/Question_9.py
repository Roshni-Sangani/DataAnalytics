#  Write python program that swap two number with temp variable and without temp variable. 

a = int(input("Enter the first number (a): "))
b = int(input("Enter the second number (b): "))

print("\nBefore swapping:")
print(f"a = {a}, b = {b}")

temp = a
a = b
b = temp

print("\nAfter swapping using a temporary variable:")
print(f"a = {a}, b = {b}")

a, b = b, a  

a = a + b
b = a - b
a = a - b

print("\nAfter swapping without using a temporary variable:")
print(f"a = {a}, b = {b}")
