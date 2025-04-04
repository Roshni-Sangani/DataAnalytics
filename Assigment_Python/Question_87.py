# When is the finally block executed?

"""
The finally block in programming is always executed, regardless of whether an exception occurs or not. 
It is used to ensure that essential cleanup tasks are performed.

When is finally executed?

If no exception occurs → The finally block executes after the try block.

If an exception occurs but is caught → The finally block executes after the catch block.

If an exception occurs and is not caught → The finally block still executes before the program crashes.

If there is a return statement inside try or catch → The finally block executes before the method actually returns.

Example in Python

try:
    num1 = int(input("Enter a number1 : "))
    num2 = int(input("Enter a number2 : "))

    ans = num1 / num2

except ValueError:
    print("Invalid input")

except ZeroDivisionError:
    print("Cannot divide by zero")

else : 
    print("ans = ",ans)

finally: 
    print("THANK YOU FOR USING THIS APPLICATION ! ")

"""