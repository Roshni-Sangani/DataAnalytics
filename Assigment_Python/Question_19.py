# Write a Python program to count the occurrences of each word in a  given sentence.

sentence = input("Enter a sentence: ")

words = sentence.lower().split()

word_count = {}

for word in words:
    word = word.strip(".,!?()[]{}")  
    if word in word_count:
        word_count[word] += 1
    else:
        word_count[word] = 1

for word, count in word_count.items():
    print(f"{word}: {count}")