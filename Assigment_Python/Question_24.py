#  Write a Python function to insert a string in the middle of a string. 

original = "HelloWorld"
insert = "Python"

middle_index = len(original) 
result = original[:middle_index] + insert + original[middle_index:]

print(result)  
