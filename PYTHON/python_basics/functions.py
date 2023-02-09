# a block of code, which performs a particular task
# to define a function, we are using a keyword called def 
# Once we type def, Python knows that now we want to define a function 

# def function_name(): # automatically it indents # one indentation = 4 spaces
#    code to be executed
# we have a function, for that function to be performed, for that has to be excecuted, we need to call that function 
# we can pass arguments or parameters

# def greet():
#     print('Welcome user')

# greet()

# def greet(name):
#     print('Welcome ' + name)

# greet('John')

# def greet(age):
#     print('Age ' + str(age))

# greet(20)

# def greet(name,age):
#     print('Welcome ' + name + '. You are ' + str(age) + ' years old. ')

# greet('John', 20)

# if we don't know the number of arguments use * before argument name - it will be a tuple or list

# def greet(*names):
#     print('Welcome ' + names[1])

# greet('John', 'Tim', 'Tom')


# def greet(name,age):
#     print('Welcome ' + name + '. You are ' + str(age) + ' years old. ')

# # greet(name = 'John', age = 20)
# greet(age = 20, name = 'John')

# def greet(name,age):
#     print('Welcome ' + name + '. You are ' + str(age) + ' years old. ')

# name = input('Enter your name: ')
# age = input('Enter your age: ')

# greet(name,age)

# Return keyword - used to get a response from the task being executed in a function

# def add():
#     return 5+10

# print(add())

def add(num1,num2):
    result = num1 + num2
    return result

print(add(5,10))