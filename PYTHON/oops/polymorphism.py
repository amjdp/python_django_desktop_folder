# The literal meaning of polymorphism is the condition of occurrence in different forms.

# Polymorphism is a very important concept in programming. It refers to the use of a single type entity 
# (method, operator or object) to represent different types in different scenarios.

# Let's take an example:

# Example 1: Polymorphism in addition operator
# We know that the + operator is used extensively in Python programs. But, it does not have a single usage.

# For integer data types, + operator is used to perform arithmetic addition operation.



num1 = 1
num2 = 2
print(num1+num2)

# Output:
# 3

# Similarly, for string data types, + operator is used to perform concatenation.

str1 = "Python"
str2 = "Programming"
print(str1+" "+str2)


# Output:
# Python Programming

# Here, we can see that a single operator + has been used to carry out different operations for 
# distinct data types. This is one of the most simple occurrences of polymorphism in Python.



# Function Polymorphism in Python
# There are some functions in Python which are compatible to run with multiple data types.

# One such function is the len() function. It can run with many data types in Python. 
# Let's look at some example use cases of the function.


#len()....string - len of string.....list - number of items....dict - number of keys

print(len("Programiz"))
print(len(["Python", "Java", "C"]))
print(len({"Name": "John", "Address": "Nepal"}))

# Output : 
# 9
# 3
# 2