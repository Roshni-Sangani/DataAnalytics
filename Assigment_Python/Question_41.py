#  Write a Python program to check whether a list contains a sub list

def contains_sublist(main_list, sub_list):
    main_len = len(main_list)
    sub_len = len(sub_list)
    for i in range(main_len - sub_len + 1):
        if main_list[i:i + sub_len] == sub_list:
            return True
    return False

main_list = [1, 2, 3, 4, 5, 6]
sub_list = [3, 4, 7, 8, 9]

result = contains_sublist(main_list, sub_list)
print(f"Does the main list contain the sublist? {result}")