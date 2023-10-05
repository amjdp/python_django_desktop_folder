class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def say_hello(self):
        print(f"Hello, my name is {self.name} and I am {self.age} years old.")

# In this example, Person is a class that defines the blueprint for creating objects of type Person. 
# The class has two attributes, name and age, which are initialized in the constructor method (__init__). 
# The say_hello method is a behavior of Person objects that simply prints a greeting with the object's 
# name and age attributes.

# To create an object of type Person, you would do the following:

person1 = Person("Alice", 25)
person1.say_hello()

# This creates a new Person object named person1 with the name attribute set to "Alice" and the age 
# attribute set to 25. The say_hello method is then called on person1, which prints "Hello, my name is 
# Alice and I am 25 years old." to the console.

# You can also create additional objects of type Person:

person2 = Person("Bob", 30)
person2.say_hello()


# This creates another Person object named person2 with the name attribute set to "Bob" and 
# the age attribute set to 30. The say_hello method is then called on person2, which prints 
# "Hello, my name is Bob and I am 30 years old." to the console.



# In Python, self is a reference to the instance of the class. It is the first argument to all instance 
# methods (including the constructor method, __init__). When you create an object of a class, self refers 
# to that object.

# In the example I provided earlier, self is used in the constructor method __init__ to set the name and 
# age attributes of the Person object. Here's how the constructor method looks like:

def __init__(self, name, age):
    self.name = name
    self.age = age


# In this method, self.name and self.age refer to the name and age attributes of the Person object that 
# is being created. The name and age arguments are passed in when the object is created, and the 
# self parameter ensures that these attributes are set on the instance of the class that is being created.

# Similarly, in the say_hello method, self is used to access the name and age attributes of the 
# Person object that the method is called on. Here's how the method looks like:

def say_hello(self):
    print(f"Hello, my name is {self.name} and I am {self.age} years old.")


# In this method, self.name and self.age refer to the name and age attributes of the Person object that 
# the method is called on. The self parameter ensures that the method is called on the instance of the 
# class that it is being called on.

# So in summary, self is a reference to the instance of the class, and it is used to access and modify 
# the attributes and methods of that instance.