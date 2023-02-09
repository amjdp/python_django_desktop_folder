countries = ['United Kingdom','Nigeria', 'Australia','India','New Zealand']
# print(countries)
print(countries[0])
print(countries[1][0])
print(countries[2:]) # to get values from a particular index number
print(countries[1:4]) # to get from one which we started & the one before which we end
print(type(countries)) # <class 'list'>

# to change a particular value from list 
# countries[0] = 'United States'
# countries[3] = 'Canada'
# print(countries)

# print(countries[1])
# print(countries[-1]) # get the least from the last value in the list

# length of list
# print(len(countries))

# we can mix different data types in a list
# countries = ['United Kingdom',50, 'Australia',True,'New Zealand']
# print(countries)
# print(countries[1:4])
# print(type(countries))
# print(type(countries[1]))
# print(type(countries[2]))
# print(type(countries[3]))

# Another way to define a list 
# Using a list constructor to construct a new list

countries = list(('United Kingdom',50, 'Australia',True,'New Zealand'))
print(countries)
list(())