class Accounts:
    __amt = 0
    def __init__(self, accnt_No, name, amt, pswd):
        self.accnt_no = accnt_No
        self.name = name
        self.__amt = amt
        self.set_amt(amt)
        self.pswd = pswd

    def account_details(self):
        print("Account Details")
        print(self.accnt_no)
        print(self.name)
        print(self.__amt)
        print(self.pswd)

    def get_amt(self):
        if(self.pswd == 12345):
            return self.__amt
        else:
            print("invalid Password")
    
    def set_amt(self,amt):
        if(amt>0):
            self.__amt+=amt
        else:
            self.__amt+=0


acc = Accounts(132454, "Jose" , 20000, 12345)
print(acc.get_amt())
print()
acc.set_amt(10000)
print(acc.get_amt())

# acc.account_details()