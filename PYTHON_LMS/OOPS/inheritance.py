# Inheritance:
# Inheritance is the process of creating a new class from an existing class, and inheriting all the 
# attributes and methods of the parent class. In Python, inheritance is achieved through the use of the super 
# function and the __init__ method. Here's an example:

class Animal:
    def __init__(self, name, species):
        self.name = name
        self.species = species

    def make_sound(self):
        pass

class Dog(Animal):
    def __init__(self, name):
        super().__init__(name, species="dog")

    def make_sound(self):
        return "woof"

class Cat(Animal):
    def __init__(self, name):
        super().__init__(name, species="cat")

    def make_sound(self):
        return "meow"


# In this example, Animal is the parent class and Dog and Cat are child classes that inherit from Animal. 
# By inheriting from Animal, Dog and Cat have access to the name and species attributes and the make_sound 
# method. Dog and Cat can also override the make_sound method to provide their own implementation.