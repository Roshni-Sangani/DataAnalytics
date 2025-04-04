#  Write python program that user to enter only odd numbers, else will raise an exception.


"""
Here is a Python program that ensures the user can only enter odd numbers. If the user enters an even number, an exception will be raised.

class OddNumberException(Exception):
    pass

def get_odd_number():
    while True:
        try:
            num = int(input("Please enter an odd number: "))
            if num % 2 == 0:
                raise OddNumberException("That's an even number! Please enter an odd number.")
            print(f"You entered the odd number: {num}")
            break
        except ValueError:
            print("That's not a valid number. Please enter a valid integer.")
        except OddNumberException as e:
            print(e)

get_odd_number()
Explanation:
The program defines a custom exception OddNumberException.

The function get_odd_number() keeps asking for input until the user enters a valid odd number.

If the user enters an even number, the custom exception is raised, and a message is displayed.

If the input is not a valid number (non-integer), it raises a ValueError.

"""