# Abstraction:
# Abstraction is the process of representing complex real-world systems with simpler, more abstract models. 
# In Python, abstraction can be achieved through the use of abstract classes and interfaces. 
# Here's an example:

from abc import ABC, abstractmethod

class Shape(ABC):
    @abstractmethod
    def area(self):
        pass

class Rectangle(Shape):
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def area(self):
        return self.width * self.height



# In this example, Shape is an abstract class that defines the area method, but does not provide an 
# implementation for it. Rectangle is a concrete class that inherits from Shape and provides an 
# implementation for the area method. By using an abstract class to define the Shape interface, 
# we can create a simpler, more abstract model of shapes without worrying about the specific implementation 
# details.