# What is the purpose continuing statement in python?


"""
Purpose of continue Statement:
    It helps skip specific iterations without breaking the entire loop.

    It is commonly used with if conditions inside loops to avoid executing certain parts of the loop body.

Example: Skipping Even Numbers

    for num in range(1, 6):  
        if num % 2 == 0:  
            continue  # Skip even numbers
        print(num)

Output:

1
3
5
"""