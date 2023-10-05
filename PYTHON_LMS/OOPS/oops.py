# Object-oriented programming (OOP) is a programming paradigm that focuses on 
# creating objects that encapsulate data and behavior. Python supports OOP concepts like encapsulation, 
# inheritance, polymorphism, and abstraction. Here is an example that demonstrates some of these 
# concepts in Python:

class Animal:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def make_sound(self):
        pass

class Cat(Animal):
    def __init__(self, name, age, color):
        super().__init__(name, age)
        self.color = color

    def make_sound(self):
        print("Meow")

class Dog(Animal):
    def __init__(self, name, age, breed):
        super().__init__(name, age)
        self.breed = breed

    def make_sound(self):
        print("Woof")

cat = Cat("Fluffy", 2, "Gray")
dog = Dog("Buddy", 4, "Labrador Retriever")

print(f"{cat.name} is {cat.age} years old and is a {cat.color} cat.")
cat.make_sound()

print(f"{dog.name} is {dog.age} years old and is a {dog.breed} dog.")
dog.make_sound()


# In this example, we define an Animal class that has an abstract make_sound method that must be 
# implemented by any subclass that inherits from it. We then define two subclasses, Cat and Dog, that 
# each implement their own make_sound method.

# We create a Cat object and a Dog object and call the make_sound method on each object. 
# Even though Cat and Dog have different implementations of the make_sound method, 
# we can treat them as if they were both Animal objects and call the make_sound method on them. 
# This is an example of polymorphism in action.

# We also use inheritance to create the Cat and Dog subclasses, which inherit the name and age 
# attributes from the Animal class. This is an example of inheritance, where a subclass inherits 
# attributes and methods from its superclass.

# Finally, we use encapsulation to hide the implementation details of the Animal class and its 
# subclasses from the outside world. We can access the name, age, and color/breed attributes of the 
# Cat and Dog objects using the dot notation, but we do not need to know how these 
# attributes are implemented. This is an example of encapsulation, where the internal workings of a 
# class are hidden from the outside world.