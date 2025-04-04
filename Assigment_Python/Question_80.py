#  Write a Python program to count the frequency of words in a file.

fname = input("Enter file name: ")
word=input("Enter word to be searched:")
k = 0
 
with open(fname, 'r') as f:
    for line in f:
        words = line.split()
        for i in words:
            if(i==word):
                k=k+1
print("Occurrences of the word:")
print(k)