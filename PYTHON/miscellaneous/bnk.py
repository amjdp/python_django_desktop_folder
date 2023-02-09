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
        print(self.__account_no,self.holder_name, self.__ifsc_code)


customer1=BankAccount("00000001","Ramu","ramu@gmail.com","999999999","kozhikode","SBI00001",'1234')
customer1.__account_no  = 2000000000
print(dir(customer1))
customer1._BankAccount__account_no = 2000
customer1.display_details()
# print(customer1.__account_no)