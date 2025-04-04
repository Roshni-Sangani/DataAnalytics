#  Write a Python program to get the Fibonacci series of given range.

def fibonacci_series(n):
    fib_series = [0, 1]
    while len(fib_series) < n:
        fib_series.append(fib_series[-1] + fib_series[-2])
    return fib_series[:n]

num = int(input("Enter the range for Fibonacci series: "))
print("Fibonacci series:", fibonacci_series(num))

