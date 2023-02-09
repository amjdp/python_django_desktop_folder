class A:
    def __init__(self):
        print("parrent class A ")

    def display1(self):
        print('hello display1  A')

    def display2(self):
        print('hello display2')

    def display3(self):
        print('hello display3')

class B: 
    def display7(self):
        print('hello display3 B')

class C(A,B):
   
    def display1(self):
        print('hello display3 C')
       
    def display5(self):
        print('hello display3')


obj2=C()      
# obj2.display1()

# obj2.display2()
obj2.display7()
# parrent class A 
# hello display3 B

# obj3=B()
