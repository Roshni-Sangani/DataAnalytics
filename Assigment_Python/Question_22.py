# Write a Python function to reverses a string if its length is a multiple of 4. 


reverse_if_multiple_of_4 = lambda s: s[::-1] if len(s) % 4 == 0 else s


print(reverse_if_multiple_of_4("abcd"))  
print(reverse_if_multiple_of_4("hello")) 
