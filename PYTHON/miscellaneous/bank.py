class BankAccount:
    def __init__(self,account_no,holder_name,email,phone_no,brach,ifsc_code,atm_pin):
        self.__account_no=account_no
        self.holder_name=holder_name
        self.email=email
        self.phone_no=phone_no
        self.brach=brach
        self.__ifsc_code=ifsc_code
        self.__atm_pin=atm_pin
    # def view_account_no(self):
    #     print(self.account_no)

    def display_details(self):
        print("details")

    def get_account_no(self):
        return self.__account_no

    @property
    def atm_pin(self):
        print("getter called")
        return self.__atm_pin

    @atm_pin.setter   
    def atm_pin(self,new_pin):
        print("setter called")
        if type(new_pin)!=str and len(str(new_pin))==4:
            self.__atm_pin=new_pin
        else:
            print("invalid pin")
            
class A(BankAccount):
    pass

    
# customer1=BankAccount("00000001","Ramu","ramu@gmail.com","999999999","kozhikode","SBI00001",'1234')
# customer2=BankAccount("00000002","Raju","raju@gmail.com","999988888","wayanad","SBI00003",'1243')
# customer1.phone_no="88888888"
#customer1.account_no="123"
# customer1.__ifsc_code = "monish"
# print(customer1._BankAccount__ifsc_code)
# print(customer1.get_account_no())
#customer1.__atm_pin="hello"
#print(customer1.__atm_pin)
#customer1.set_atm_pin(7890)
#print(customer1.get_atm_pin())
obj=A("00000002","Raju","raju@gmail.com","999988888","wayanad","SBI00003",'1243')
# obj.__ifsc_code = "njbjbk"
# print(obj._BankAccount__ifsc_code)
print(obj.atm_pin)



