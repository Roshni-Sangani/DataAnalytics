# Write a Python function to get the largest number, smallest num and sum of all from a list. 

user_input = input("Enter numbers separated by spaces: ")
numbers = [int(num) for num in user_input.split()]

if numbers:
    largest = max(numbers)
    smallest = min(numbers)
    total_sum = sum(numbers)
    
    print(f"Largest: {largest}, Smallest: {smallest}, Sum: {total_sum}")
else:
    print("List is empty")

