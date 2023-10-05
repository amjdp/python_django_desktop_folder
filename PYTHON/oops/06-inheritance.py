# In the above example, we have created a superclass: Polygon and 
# two subclasses: Square and Circle. Notice the use of the render() method.

# The main purpose of the render() method is to render the shape. 
# However, the process of rendering a square is different from the process of rendering a circle.

# Hence, the render() method behaves differently in different classes. 
# Or, we can say render() is polymorphic.


# A parent class is a class whose properties are inherited by the child class. 
# Let’s create a parent class called Person which has a Display method to display the person’s information.

# A Python program to demonstrate inheritance
class Person(object):

# Constructor
    def __init__(self, name, id):
        self.name = name
        self.id = id

# To check if this person is an employee
    def Display(self):
        print(self.name, self.id)


# Driver code
emp = Person("Satyam", 102) # An Object of Person
emp.Display()



# A child class is a class that drives the properties from its parent class. 
# Here Emp is another class that is going to inherit the properties of the Person class(base class).


class Emp(Person):

    def Print(self):
        print("Emp class called")
	
Emp_details = Emp("Mayank", 103)

# calling parent class function
Emp_details.Display()

# Calling child class function
Emp_details.Print()
