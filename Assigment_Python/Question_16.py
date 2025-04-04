# Write a Python program to count the number of characters (character frequency) in a string 


s = input("Enter a string : ")
freq = {}

for c in s:
    if c in freq:
        freq[c] += 1
    else:
        freq[c] = 1

print(freq)