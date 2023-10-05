# Encapsulation:
# Encapsulation is the process of hiding the implementation details of an object from the outside world, 
# and exposing only the necessary interfaces for interacting with the object. In Python, encapsulation can
# be achieved through the use of access modifiers like public, private, and protected. Here's an example:

class BankAccount:
    def __init__(self, account_number, balance):
        self.__account_number = account_number  # private attribute
        self.__balance = balance  # private attribute

    def deposit(self, amount):
        self.__balance += amount

    def withdraw(self, amount):
        if amount > self.__balance:
            print("Insufficient balance.")
        else:
            self.__balance -= amount

    def get_balance(self):
        return self.__balance


# In this example, __account_number and __balance are private attributes that are not accessible from 
# outside the BankAccount class. The deposit, withdraw, and get_balance methods provide a public interface 
# for interacting with the BankAccount object.