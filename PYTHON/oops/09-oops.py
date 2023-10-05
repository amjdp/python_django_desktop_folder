# Abstraction involves defining a simplified representation of an object by focusing on its essential properties 
# and behaviors while hiding unnecessary details. 
# In our example, we'll define an abstract base class Shape with common properties and 
# methods that all shapes share:

from abc import ABC, abstractmethod

class Shape(ABC):
    def __init__(self, color):
        self.color = color

    @abstractmethod
    def area(self):
        pass

    @abstractmethod
    def perimeter(self):
        pass

# Here, Shape is an abstract class with abstract methods area and perimeter. 
# It defines a common interface for all shapes but leaves the specific implementations to its subclasses.

# Encapsulation:

# Encapsulation involves bundling data (attributes) and methods (functions) 
# that operate on the data into a single unit (class). 
# In our example, we encapsulate the color attribute within the Shape class:


# class Shape(ABC):
#     def __init__(self, color):
#         self.color = color


# This attribute is encapsulated within the Shape class, and subclasses can access it through inheritance 
# but not directly.

# Inheritance:

# Inheritance allows one class (subclass) to inherit attributes and methods from another class (superclass). 
# In our example, we'll create subclasses for specific shapes (Circle and Rectangle) 
# that inherit from the Shape superclass:

class Circle(Shape):
    def __init__(self, color, radius):
        super().__init__(color)
        self.radius = radius

    def area(self):
        return 3.1415 * self.radius ** 2

    def perimeter(self):
        return 2 * 3.1415 * self.radius

class Rectangle(Shape):
    def __init__(self, color, width, height):
        super().__init__(color)
        self.width = width
        self.height = height

    def area(self):
        return self.width * self.height

    def perimeter(self):
        return 2 * (self.width + self.height)


# Both Circle and Rectangle subclasses inherit the color attribute from the Shape superclass and 
# provide their specific implementations of the area and perimeter methods.

# Polymorphism:

# Polymorphism allows objects of different classes to be treated as objects of a common superclass. 
# In our example, we can create instances of both Circle and Rectangle and use them in a generic way, 
# thanks to polymorphism:

shapes = [Circle("Red", 5), Rectangle("Blue", 4, 6)]

for shape in shapes:
    print(f"Shape: {type(shape).__name__}")
    print(f"Color: {shape.color}")
    print(f"Area: {shape.area()}")
    print(f"Perimeter: {shape.perimeter()}\n")


# Here, we iterate through a list of different shapes (both circles and rectangles) and call the area 
# and perimeter methods on each shape object without knowing their specific types in advance.

# In summary, this example demonstrates the concepts of abstraction, encapsulation, inheritance, 
# and polymorphism using a Shapes class hierarchy. The Shape base class abstracts common behavior, 
# encapsulates the color attribute, and defines a common interface. Subclasses (Circle and Rectangle) 
# inherit from Shape and provide their specific implementations of area and perimeter, 
# showcasing polymorphism when objects of different types are treated uniformly.


# Creating a List of Shapes:

# In the first line, we create a list called shapes that contains instances of different shapes. 
# Specifically, we have a Circle and a Rectangle. 
# Each shape is created with specific characteristics: color, radius (for the circle), width, and 
# height (for the rectangle).

# Circle("Red", 5) creates a red circle with a radius of 5 units.
# Rectangle("Blue", 4, 6) creates a blue rectangle with a width of 4 units and a height of 6 units.
# Iterating Through the List of Shapes:

# The for loop iterates through each shape in the shapes list one by one. 
# In this loop, shape represents the current shape object being processed.

# Printing Shape Information:

# Within the loop, we print information about each shape:

# print(f"Shape: {type(shape).__name__}"): This line prints the type (class) of the shape using the type() function. 
# We use .__name__ to extract the class name as a string. 
# For example, it will print "Circle" for a circle object and "Rectangle" for a rectangle object.

# print(f"Color: {shape.color}"): This line prints the color of the shape, 
# which is an attribute inherited from the Shape base class.

# print(f"Area: {shape.area()}"): This line calls the area() method of the shape object. 
# The specific implementation of area() depends on the shape type (circle or rectangle) 
# and calculates the area accordingly.

# print(f"Perimeter: {shape.perimeter()}\n"): This line calls the perimeter() method of the shape object. 
# Similar to the area() method, the specific implementation of perimeter() depends on the shape type 
# and calculates the perimeter accordingly.

# Output:

# When you run this code, it will iterate through the shapes list, print information about each shape, 
# and display the following output:


# Output -

# Shape: Circle
# Color: Red
# Area: 78.5375
# Perimeter: 31.415\n

# Shape: Rectangle
# Color: Blue
# Area: 24
# Perimeter: 20\n
