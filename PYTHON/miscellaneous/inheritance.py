# Inheritance in python - Parent -> Child - Parent Class -> Child Class



class A:
    def __init__(self):
        print("parrent class A ")
    def display1(self):
        print('hello display1 ')

    def display2(self):
        print('hello display2')

    def display3(self):
        print('hello display3')

class B(A):
    # def __init__(self):
    #     # super().__init__()
    #     print('child class B')
       
    def display4(self):
        print('hello display3')

class C(B):
    def __init__(self):
        super().__init__()
        print('child class')
       
    def display5(self):
        print('hello display5')


# obj2=C()      
# obj2.display2()

obj3 = B()
obj3.display1()



# Parent 

# class Person:
#     def __init__(self,name,contact):
#         self.name = name
#         self.contact = contact

#     def address(self):
#         print(self.name, self.contact)

# # Child Class 

# class Doctor(Person):
#     pass

# class Patient(Person):
#     pass

# dr1 = Doctor("John",12345)
# pt1 = Patient("Akhil",986548)

# dr1.address()
# pt1.address()