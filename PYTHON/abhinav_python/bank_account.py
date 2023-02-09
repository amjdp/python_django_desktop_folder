class BankAccount:
    def __init__(self,holder,accnumber,ifsc,branch,mobile,email,atmpin):

        self.accholder_name = holder
        self.accnumber = accnumber
        self.ifsc_code = ifsc
        self.branch = branch
        self.mobile = mobile
        self.email = email
        self.atmpin = atmpin

    def display_details(self):
        print(self.accholder_name)
        print(self.accnumber)
        print(self.ifsc_code)
        print(self.branch)
        print(self.mobile)
        print(self.email)
        print(self.atmpin)


acc1 = BankAccount('abhinav',85895213102,'CNBK0030','kannur',8589877125,'abhinavsuresh159@gmail.com',3434)

acc1.display_details()