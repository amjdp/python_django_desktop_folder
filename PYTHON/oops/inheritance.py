# Inheritance enables us to define a class that takes all the functionality from a parent class and 
# allows us to add more. It refers to defining a new class with little or no modification to an existing class. 
# The new class is called derived (or child) class and the one from which it inherits is called the 
# base (or parent) class.Derived class inherits features from the base class where new features can be added 
# to it. This results in re-usability of code.

# In the above example, notice that __init__() method was defined in both classes, Triangle as well Polygon. 
# When this happens, the method in the derived class overrides that in the base class. 
# This is to say, __init__() in Triangle gets preference over the __init__ in Polygon.

# Generally when overriding a base method, we tend to extend the definition rather than simply replace it. 
# The same is being done by calling the method in base class from the one in derived class 
# (calling Polygon.__init__() from __init__() in Triangle).

# A better option would be to use the built-in function super(). So, super().__init__(3) is equivalent 
# to Polygon.__init__(self,3) and is preferred.




class A:
    def __init__(self):
        print('From Parent')

    def display1(self):
        print('hello display1....')

    def display2(self):
        print('hello display2....')

    def display3(self):
        print('hello display3.....')

#Single Level - parent to child - reverse is not possible
# C-A .. Grandparent Multiline
# A - super class / base class / parent class
# B - child class / derived class
# call the obj of B obj2 = B() ....obj2.
# display 4...(B)...display 1,2,3,4
    
class B(A):
    # def display1(self):
    #     print('hello display1....')

    # def display2(self):
    #     print('hello display2....')

    # def display3(self):
    #     print('hello display3.....')

    # def __init__(self):       # call parent class from the init method of child class .... super()
        # super().__init__()
        # print('From Child')

    def display4(self):
        print('hello display4.....')

# class C(B):
#     # def __init__(self):
#     #     # super().__init__()
#     #     print('From Child.....')

#     def display5(self):
#         print('hello display3.....')

# obj1=A()
obj2=B()
# obj2.

# obj3=C()
obj2.display1()
obj2.display4()
# obj2.display3()
# obj2.display4()
obj2.display1()


























# # A class can be derived from more than one base class in Python, similar to C++. 
# # This is called multiple inheritance.

# # In multiple inheritance, the features of all the base classes are inherited into the derived class . 
# # The syntax for multiple inheritance is similar to single inheritance.


# class A:
#     def display1(self):
#         print('hello display1....')

#     def display2(self):
#         print('hello display2....')

#     def display3(self):
#         print('hello display3.....')


# class B():
#     def display4(self):
#         print('hello display4.....')

# # Multiple inheritance .... no relation between A and B...priority to left class


# class C(A, B):
#     def display5(self):
#         print('hello display5.....')


# # obj1=A()
# # obj2=B()
# # obj2.
# obj2 = C()

# obj2.display5()
