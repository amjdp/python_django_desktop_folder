# list1 = [1, 2, 3, 4, 5]
# list2 = ['Banana', 'Apple', 'Mango', 'Orange']
# to join these two lists together
# list1.extend(list2)
# print(list1)
# print(len(list2))
# list2.append('Kiwi')
# print(list2)
# print(len(list2))
# list2.insert(1, 'Cherry')
# print(list2)
# list2.remove('Banana')
# print(list2)
# list2.clear()
# print(list2)
# print(list2.index('Mango'))
# print(list2.count('Mango'))

list3 = [4, 3, 5, 1, 2]
# list3.sort()
# print(list3)
# list3.reverse()
# print(list3)

# list4 = list3.copy()
# print(list4)

# to delete the last value from the list 
list2 = ['Banana', 'Apple', 'Mango', 'Orange']
# list2.pop()
# print(list2)

# to remove a particular value 
# list2.remove('Apple')
# print(list2)

# to delete a particular index value 
# list2.pop(2)
# print(list2)

del list2[0]
print(list2)

del list2
print(list2)

# if we use list2.clear(), it will clear all values in the list. But the list is available in the code.
# when we use del, it will delete the entire list & it will not be there in our code. 
# If we try to print the list again we get an error - NameError: name 'list2' is not defined