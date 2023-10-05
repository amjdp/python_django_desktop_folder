# Polymorphism:
# Polymorphism is the process of using a single interface to represent multiple types of objects. 
# In Python, polymorphism can be achieved through the use of inheritance and duck typing. 
# Here's an example:


class Shape:
    def area(self):
        pass

class Rectangle(Shape):
    def __init__(self, length, width):
        self.length = length
        self.width = width

    def area(self):
        return self.length * self.width

class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius

    def area(self):
        return 3.14 * self.radius ** 2

shapes = [Rectangle(5, 10), Circle(7), Rectangle(3, 6)]

for shape in shapes:
    print(f"The area of the shape is: {shape.area()}")


# In this example, we have a Shape class with an abstract area method that must be implemented by any 
# subclass that inherits from it. We then define two subclasses, Rectangle and Circle, that each implement 
# their own area method.

# We create a list of Shape objects that contains two Rectangle objects and one Circle object. 
# We then iterate over the list and call the area method on each object, which returns the area of the 
# respective shape.

# Even though Rectangle and Circle have different implementations of the area method, 
# we can treat them as if they were both Shape objects and call the area method on them. 
# This is an example of polymorphism in action, where objects of different types can be 
# treated as if they were the same type.



















class Vehicle:
    def __init__(self, brand, model):
        self.brand = brand
        self.model = model

    def drive(self):
        pass

class Car(Vehicle):
    def __init__(self, brand, model, num_wheels):
        super().__init__(brand, model)
        self.num_wheels = num_wheels

    def drive(self):
        print(f"Driving the {self.brand} {self.model} car with {self.num_wheels} wheels.")

class Motorcycle(Vehicle):
    def __init__(self, brand, model):
        super().__init__(brand, model)

    def drive(self):
        print(f"Riding the {self.brand} {self.model} motorcycle.")

class Bicycle(Vehicle):
    def __init__(self, brand, model):
        super().__init__(brand, model)

    def drive(self):
        print(f"Riding the {self.brand} {self.model} bicycle.")

vehicles = [Car("Toyota", "Camry", 4), Motorcycle("Harley-Davidson", "Sportster"), Bicycle("Trek", "FX")]

for vehicle in vehicles:
    vehicle.drive()




# In this example, we have a Vehicle class with an abstract drive method that must be implemented by any 
# subclass that inherits from it. We then define three subclasses, Car, Motorcycle, and Bicycle, that each 
# implement their own drive method.

# We create a list of Vehicle objects that contains one Car object, one Motorcycle object, and one 
# Bicycle object. We then iterate over the list and call the drive method on each object, which executes 
# the respective implementation of the method.

# Even though Car, Motorcycle, and Bicycle have different implementations of the drive method, we can treat them as if they were all Vehicle objects and call the drive method on them. This is an example of polymorphism in action, where objects of different types can be treated as if they were the same type.