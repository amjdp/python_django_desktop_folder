class Laptop:
    def __init__(self,clr,model,processor,ram):
        self.color = clr
        self.model = model
        self.processor = processor
        self.ram = ram
        

    def display_details(self):
        print("test")
        print(self.color)
        print(self.model)
        print(self.processor)
        print(self.ram)
        


    def power_on(self):
        print('power on')

    def power_off(self):
        print('power off')



acer = Laptop('black','nitro 5','intel i7',16)


# hp = Laptop()
# hp.manufacture = 'HP'
# hp.model = 'pavillion'
# hp.display = 'Full HD+'
acer.display_details()